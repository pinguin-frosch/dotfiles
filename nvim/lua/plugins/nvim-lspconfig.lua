return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'b0o/SchemaStore.nvim',
    { 'williamboman/mason.nvim', build = ':MasonUpdate', config = true }
  },
  config = function()
    local servers = { 'tsserver', 'clangd', 'gopls', 'pyright', 'rust_analyzer', 'r_language_server', 'dockerls',
      'docker_compose_language_service', 'bashls', 'cssls', 'lua_ls', 'html' }
    for _, lsp in ipairs(servers) do
      require('lspconfig')[lsp].setup({
        on_attach = function(_, bufnr)
          require('lsp').setup_keymaps(bufnr)
        end,
        capabilities = require('lsp').capabilities,
      })
    end
  end
}
