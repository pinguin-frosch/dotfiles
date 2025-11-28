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
          vim.keymap.set('n', '<leader>gp', gitsigns.preview_hunk, { desc = 'Preview Current Hunk' })
        end
      })
    end,
  },
  {
    'kdheepak/lazygit.nvim',
    lazy = true,
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    keys = {
      { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'LazyGit' }
    },
    config = function()
      vim.g.lazygit_floating_window_scaling_factor = 1
      vim.g.lazygit_floating_window_border_chars = 'none'
    end,
  }
}
