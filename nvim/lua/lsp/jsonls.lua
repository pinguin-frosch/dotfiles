local M = {}

M.opts = {
  on_attach = function(_, bufnr)
    require('lsp.lsp').setup_keymaps(bufnr)
    vim.keymap.del('n', '<leader>f', { buffer = bufnr })
    vim.keymap.set('n', '<leader>f', ':%!jq .<CR>', { buffer = bufnr })
  end,
  init_options = {
    provideFormatter = false
  },
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true }
    }
  }
}

return M
