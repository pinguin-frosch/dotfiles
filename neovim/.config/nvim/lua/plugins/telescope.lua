return {
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  version = '*',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    {
      '<leader>sf',
      function()
        require('telescope.builtin').find_files({
          find_command = { 'rg', '--files', '--hidden', '--follow', '--glob', '!.git' }
        })
      end,
      desc = 'Search files'
    }
  },
}
