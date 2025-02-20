return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  cmd = 'NvimTreeToggle',
  keys = {
    { '<leader>e', '<Cmd>NvimTreeToggle<CR>', desc = 'Open File Explorer' }
  },
  config = function()
    require('nvim-tree').setup {
      view = {
        width = 40,
        side = "right"
      }
    }
  end
}
