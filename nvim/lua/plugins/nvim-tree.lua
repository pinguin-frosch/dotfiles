return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  cmd = 'NvimTreeToggle',
  keys = {
    { '<Leader>e', '<Cmd>NvimTreeToggle<CR>', desc = 'Open File Explorer' }
  },
  config = true
}
