return {
  'nvim-treesitter/nvim-treesitter',
  version = false,
  build = ':TSUpdate',
  event = { 'BufRead', 'BufNewFile' },
  dependencies = { 'nvim-treesitter/playground' },
  config = function()
    require('nvim-treesitter.configs').setup({
      highlight = { enable = true },
      playground = { enable = true },
      indent = { enable = true },
      ensure_installed = 'all',
    })
  end,
}
