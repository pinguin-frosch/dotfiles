return {
  'nvim-treesitter/nvim-treesitter',
  version = false,
  build = ':TSUpdate',
  event = { 'BufReadPost', 'BufNewFile' },
  dependencies = { 'p00f/nvim-ts-rainbow' },
  opts = {
    highlight = { enable = true },
    rainbow = { enable = true, extended_mode = true, max_file_lines = 1000 },
    indent = { enable = true },
    ensure_installed = { 'python', 'lua', 'go', 'javascript', 'typescript', 'rust', 'vim', 'help' },
  },
  config = function(_, opts)
    require('nvim-treesitter.configs').setup(opts)
    vim.keymap.set('n', '<leader>th', function()
      vim.cmd('TSBufToggle highlight')
    end, { desc = 'Toggle treesitter highlight' })
    vim.keymap.set('n', '<leader>tr', function()
      vim.cmd('TSBufToggle rainbow')
    end, { desc = 'Toggle treesitter rainbow' })
  end,
}
