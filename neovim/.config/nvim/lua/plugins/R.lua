return {
  {
    'jalvesaq/Nvim-R',
    config = function()
      vim.g.R_user_maps_only = 1
      vim.g.R_assign = 0
      vim.g.R_hl_term = 0

      vim.keymap.set('n', '<leader>rs', '<Plug>RStart')
      vim.keymap.set('n', '<leader>ro', '<Plug>RUpdateObjBrowser')
      vim.keymap.set('n', '<leader>rl', '<Plug>RListSpace')
      vim.keymap.set('n', '<leader>rq', '<Plug>RClose')
      vim.keymap.set('n', '<leader>rc', '<Plug>RClearConsole')
      vim.keymap.set('n', '<leader>rC', '<Plug>RClearAll')
      vim.keymap.set('n', '<leader>rr', '<Plug>RSendLine')
      vim.keymap.set('v', '<leader>rr', '<Plug>RSendSelection')
      vim.keymap.set('n', '<leader>rR', '<Plug>RSendFile')
    end
  },
  {
    'jalvesaq/cmp-nvim-r'
  }
}
