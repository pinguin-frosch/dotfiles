require('lspconfig')['html'].setup({
  on_attach = function(_, bufnr)
    require('lsp').setup_keymaps(bufnr)
  end,
  capabilities = require('lsp').capabilities,
  filetypes = { 'html', 'htmldjango' }
})
