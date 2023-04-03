return {
  {
    -- Autocerrar pares
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true
  },
  {
    -- Plugin para comentar
    'numToStr/Comment.nvim',
    keys = { 'gc', 'gb', { 'gc', mode = 'v' }, { 'gb', mode = 'v' } },
    config = true
  },
  {
    -- Plugin para modificar los delimitadores
    'kylechui/nvim-surround',
    keys = { 'cs', 'ds', 'ys' },
    config = true
  },

  -- Detectar indentación
  'tpope/vim-sleuth',

  -- Mejorar el manejo de archivos grandes
  {
    'lunarvim/bigfile.nvim',
    config = true,
    event = { 'BufRead', 'BufWinEnter', 'BufNewFile' },
  },
}
