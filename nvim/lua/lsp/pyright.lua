local M = {}

M.opts = {
  on_attach = function(_, bufnr)
    require('lsp.lsp').setup_keymaps(bufnr)
    vim.keymap.del('n', '<leader>lf', { buffer = bufnr })
    vim.keymap.set('n', '<leader>lf', function()
      vim.cmd('silent !ruff check --select I --fix %')
      vim.cmd('silent !ruff format %')
    end, { buffer = bufnr, desc = 'Format File' })
  end
}

return M
