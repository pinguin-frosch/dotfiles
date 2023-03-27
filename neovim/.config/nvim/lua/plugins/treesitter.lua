return {
  'nvim-treesitter/nvim-treesitter',
  version = false,
  build = ':TSUpdate',
  event = { 'BufRead', 'BufNewFile', 'BufWinEnter' },
  dependencies = { 'HiPhish/nvim-ts-rainbow2' },
  config = function()
    require('nvim-treesitter.configs').setup({
      highlight = { enable = true },
      rainbow = {
        enable = true,
        strategy = require('ts-rainbow.strategy.local'),
        query = { 'rainbow-parens' }
      },
      indent = { enable = true },
      ensure_installed = { 'python', 'lua', 'go', 'javascript', 'typescript', 'rust', 'vim', 'help' },
    })
  end,
}
