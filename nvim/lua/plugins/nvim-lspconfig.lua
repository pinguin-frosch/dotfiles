return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'b0o/SchemaStore.nvim',
    { 'williamboman/mason.nvim', build = ':MasonUpdate', config = true }
  },
  config = function()
    vim.keymap.set('n', '<leader>lsr', '<Cmd>LspRestart<CR>', { desc = 'Restart LSP Server' })
    local servers = { 'ts_ls', 'clangd', 'gopls', 'pyright', 'rust_analyzer', 'dockerls',
      'docker_compose_language_service', 'bashls', 'cssls', 'lua_ls', 'html', 'jsonls', 'svelte' }
    for _, lsp in ipairs(servers) do
      local opts = {
        on_attach = function(_, bufnr)
          require('lsp.lsp').setup_keymaps(bufnr)
        end,
        capabilities = require('lsp.lsp').capabilities
      }
      local status, server = pcall(require, 'lsp.' .. lsp)
      if status then
        opts = vim.tbl_extend('force', opts, server.opts)
      end
      require('lspconfig')[lsp].setup(opts)
    end
  end
}
