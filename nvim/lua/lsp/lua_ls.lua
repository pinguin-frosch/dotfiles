local M = {}

local on_attach = function(client, bufnr)
  require('lsp.lsp').setup_keymaps(bufnr)
  client.server_capabilities.semanticTokensProvider = nil
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
