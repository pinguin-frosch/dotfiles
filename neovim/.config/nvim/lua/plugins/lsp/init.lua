return {
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      local servers = require('plugins.lsp.config').servers

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      require('mason').setup({})

      local mason_lsp = require('mason-lspconfig')

      mason_lsp.setup({
        ensure_installed = vim.tbl_keys(servers),
      })

      mason_lsp.setup_handlers({
        function(server_name)
          require('lspconfig')[server_name].setup({
            capabilities = capabilities,
            settings = servers[server_name],
            on_attach = require('plugins.lsp.config').on_attach,
            init_options = servers[server_name].init_options,
          })
        end
      })

    end,
  },
  {
    'b0o/schemastore.nvim',
    lazy = true
  }
}
