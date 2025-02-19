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
      { '<leader>th', '<Cmd>HighlightColors Toggle<CR>', desc = 'Highlight Colors' },
    },
    config = true
  }
}
