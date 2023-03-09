return {
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  version = '*',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { '<leader>sf', function() vim.cmd('Telescope find_files') end, desc = 'Search files' }
  },
}
