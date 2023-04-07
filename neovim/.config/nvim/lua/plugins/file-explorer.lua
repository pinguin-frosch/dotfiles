return {
  -- Explorador de archivos
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  config = function()
    require('nvim-tree').setup()
    vim.keymap.set('n', '<leader>e', vim.cmd.NvimTreeToggle, { desc = 'Open File Explorer' })
  end,
}
