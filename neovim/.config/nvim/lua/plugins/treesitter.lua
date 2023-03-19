return {
  'nvim-treesitter/nvim-treesitter',
  version = false,
  build = ':TSUpdate',
  event = { 'BufReadPost', 'BufNewFile' },
  dependencies = { 'HiPhish/nvim-ts-rainbow2' },
  config = function()
    require('nvim-treesitter.configs').setup({
      highlight = {
        enable = true,
        disable = function()
          if vim.b.big_file then
            return true
          end
        end
      },
      rainbow = {
        enable = true,
        strategy = require('ts-rainbow.strategy.local'),
        query = { 'rainbow-parens' }
      },
      indent = {
        enable = true
      },
      ensure_installed = { 'python', 'lua', 'go', 'javascript', 'typescript', 'rust', 'vim', 'help' },
    })
    vim.keymap.set('n', '<leader>th', function()
      vim.cmd('TSBufToggle highlight')
    end, { desc = 'Toggle treesitter highlight' })
    vim.keymap.set('n', '<leader>tr', function()
      vim.cmd('TSBufToggle rainbow')
    end, { desc = 'Toggle treesitter rainbow' })
  end,
}
