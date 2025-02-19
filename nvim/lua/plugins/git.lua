return {
  {
    'lewis6991/gitsigns.nvim',
    cmd = 'Gitsigns',
    event = { 'BufRead', 'BufNewFile' },
    config = function()
      require('gitsigns').setup({
        on_attach = function()
          local gitsigns = require('gitsigns')
          vim.keymap.set('n', '[h', function()
            gitsigns.nav_hunk('prev')
          end, { desc = 'Previous Hunk' })
          vim.keymap.set('n', ']h', function()
            gitsigns.nav_hunk('next')
          end, { desc = 'Next Hunk' })
          vim.keymap.set('n', '<leader>gd', gitsigns.diffthis, { desc = 'Diff Current File' })
          vim.keymap.set('n', '<leader>gb', gitsigns.blame_line, { desc = 'Blame Current Line' })
        end
      })
    end,
  }
}
