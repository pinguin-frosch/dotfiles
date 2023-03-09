return {
  -- Explorador de archivos
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  config = true,
  keys = {
    { '<leader>e', function() vim.cmd('NvimTreeToggle') end, desc = 'Open File Explorer' }
  },
}
