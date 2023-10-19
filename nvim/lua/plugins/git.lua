return {
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      local gs = require('gitsigns')
      gs.setup()
      vim.keymap.set('n', '(h', gs.prev_hunk)
      vim.keymap.set('n', ')h', gs.next_hunk)
      vim.keymap.set('n', '<leader>gd', gs.diffthis)
    end
  }
}
