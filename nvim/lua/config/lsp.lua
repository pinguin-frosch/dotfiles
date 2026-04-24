local servers = { 'ts_ls', 'clangd', 'gopls', 'pyright', 'rust_analyzer', 'dockerls', 'docker_compose_language_service',
  'bashls', 'cssls', 'html', 'jsonls', 'svelte', 'lua_ls', 'emmet_language_server' }
vim.lsp.enable(servers)

-- Quitar atajos por defecto de lsp
vim.keymap.del('n', 'gra')
vim.keymap.del('n', 'gri')
vim.keymap.del('n', 'grn')
vim.keymap.del('n', 'grr')
vim.keymap.del('n', 'grt')
vim.keymap.del('n', 'grx')
vim.keymap.del('n', 'gO')

---@alias FormatFnFactory fun(args: vim.api.keyset.create_autocmd.callback_args): function
---@type table<string, FormatFnFactory>
local language_format_functions = {
  go = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local enc = client and client.offset_encoding or 'utf-16'
    return function()
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
    end
  end,
}

---@param args vim.api.keyset.create_autocmd.callback_args
---@return function
local function get_language_format_function(args)
  local filetype = vim.bo[args.buf].filetype
  local factory_fn = language_format_functions[filetype]

  -- execute to generate a ready to use function to format
  if factory_fn then
    return factory_fn(args)
  end

  -- base case if there is no custom format function
  return vim.lsp.buf.format
end

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('LspKeymaps', { clear = true }),
  callback = function(ev)
    local nmap = function(keys, func, desc)
      vim.keymap.set('n', keys, func, { buffer = ev.buf, desc = desc })
    end
    nmap('<leader>lr', function()
      vim.lsp.buf.rename()
      vim.cmd('silent! wa')
    end, 'Rename')
    nmap('<leader>la', vim.lsp.buf.code_action, 'Code Actions')
    nmap('gd', vim.lsp.buf.definition, 'Goto Definition')
    nmap('gr', function()
      require('mini.extra').pickers.lsp({ scope = 'references' })
    end, 'Goto References')
    nmap('gI', vim.lsp.buf.implementation, 'Goto Implementation')
    nmap('gD', vim.lsp.buf.type_definition, 'Goto Type Definition')
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
    local format_function = get_language_format_function(ev)
    nmap('<leader>lf', format_function, 'Format File')
  end
})
