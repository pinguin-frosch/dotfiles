return {
  'navarasu/onedark.nvim',
  'catppuccin/nvim',
  'Shatur/neovim-ayu',
  {
    'lunarvim/bigfile.nvim',
    config = true,
    event = { 'BufReadPre' },
  },
  {
    'brenoprata10/nvim-highlight-colors',
    cmd = 'HighlightColorsToggle',
    keys = {
      { '<Leader>th', '<Cmd>HighlightColors Toggle<CR>', desc = 'Toggle highlight colors' },
    },
    config = true
  }
}
