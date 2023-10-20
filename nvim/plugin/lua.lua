require('lspconfig')['lua_ls'].setup({
  on_attach = function(client, bufnr)
    require('lsp').setup_keymaps(bufnr)
    client.server_capabilities.semanticTokensProvider = nil
  end,
  capabilities = require('lsp').capabilities,
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
})
