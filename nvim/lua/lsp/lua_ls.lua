local M = {}

local on_attach = function(_, bufnr)
  require('lsp.lsp').setup_keymaps(bufnr)
end

M.opts = {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      },
      workspace = {
        checkThirdParty = false
      }
    }
  }
}

return M
