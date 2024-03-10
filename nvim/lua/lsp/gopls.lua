local M = {}

local on_attach = function(_, bufnr)
  require('lsp.lsp').setup_keymaps(bufnr)
end

M.opts = {
  on_attach = on_attach,
  settings = {
    gopls = {
      analyses = {
        shadow = true,
        unusedparams = true,
        unusedvariable = true,
      },
      staticcheck = true
    }
  }
}

return M
