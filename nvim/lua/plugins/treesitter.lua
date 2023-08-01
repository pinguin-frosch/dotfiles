return {
  'nvim-treesitter/nvim-treesitter',
  version = false,
  build = ':TSUpdate',
  event = { 'BufRead', 'BufNewFile' },
  config = function()
    require('nvim-treesitter.configs').setup({
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
