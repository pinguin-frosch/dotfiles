vim.api.nvim_create_autocmd('LspAttach', {
  pattern = "*.go",
  group = vim.api.nvim_create_augroup('goimports', {}),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local enc = client and client.offset_encoding or 'utf-16'
    vim.keymap.set('n', '<leader>lf', function()
      local params = vim.lsp.util.make_range_params(0, enc)
      ---@diagnostic disable-next-line: inject-field
      params.context = { only = { "source.organizeImports" } }
      local result = vim.lsp.buf_request_sync(args.buf, "textDocument/codeAction", params)
      for _, res in pairs(result or {}) do
        for _, r in pairs(res.result or {}) do
          if r.edit then
            vim.lsp.util.apply_workspace_edit(r.edit, enc)
          end
        end
      end
      vim.lsp.buf.format({ async = false })
    end, { buffer = args.buf })
  end
})

return {
  settings = {
    gopls = {
      analyses = {
        -- Estas opciones molestan un poco al escribir, las puedo activar cuando necesite
        -- https://github.com/golang/tools/blob/master/gopls/doc/analyzers.md
        ['ST1000'] = false,
        ['ST1020'] = false,
        ['ST1021'] = false,
        ['ST1022'] = false,
      },
      staticcheck = true
    }
  }
}
