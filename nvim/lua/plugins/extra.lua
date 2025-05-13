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
    event = 'VeryLazy',
    config = function()
      require('nvim-highlight-colors').setup()
      local colors = require('nvim-highlight-colors')
      colors.turnOff()
      vim.keymap.set('n', '<leader>th', function()
        colors.toggle()
        local enabled = colors.is_active()
        print('Highlight Colors ' .. (enabled and 'Enabled' or 'Disabled'))
      end, { desc = 'Highlight Colors' })
    end,
  },
  {
    "echasnovski/mini.icons",
    version = "*",
    config = true
  }
}
