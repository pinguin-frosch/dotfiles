return {
  {
    'lewis6991/gitsigns.nvim',
    cmd = 'Gitsigns',
    event = { 'BufRead', 'BufNewFile' },
    keys = {
      { '(h', '<Cmd>Gitsigns prev_hunk<CR>', 'Go to previous hunk' },
      { ')h', '<Cmd>Gitsigns next_hunk<CR>', 'Go to next hunk' },
      { '<Leader>gd', '<Cmd>Gitsigns diffthis<CR>', 'Diff current file' },
    },
    config = true
  }
}
