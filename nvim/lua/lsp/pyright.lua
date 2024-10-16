local M = {}

M.opts = {
  on_attach = function(_, bufnr)
    require('lsp.lsp').setup_keymaps(bufnr)
    vim.keymap.del('n', '<leader>f', { buffer = bufnr })
    vim.keymap.set('n', '<leader>f', function()
      vim.cmd('silent !ruff check --select I --fix %')
      vim.cmd('silent !ruff format %')
    end, { buffer = bufnr })
  end
}

return M
