return {
  'neovim/nvim-lspconfig',
  {
    'b0o/SchemaStore.nvim',
    lazy = true,
  },
  {
    'mason-org/mason.nvim',
    opts = {}
  },
  'olexsmir/gopher.nvim',
  ft = 'go',
  build = function()
    vim.cmd.GoInstallDeps()
  end,
  opts = {},
}
