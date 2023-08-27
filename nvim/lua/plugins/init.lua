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

  -- Mejorar el manejo de archivos grandes
  {
    'lunarvim/bigfile.nvim',
    config = true,
    event = { 'BufReadPre' },
  },

  -- Renderizar los colores dentro del editor
  {
    'brenoprata10/nvim-highlight-colors',
    keys = {
      { '<leader>th', function()
        require('nvim-highlight-colors').toggle()
      end }
    }
  },

  {
    'NMAC427/guess-indent.nvim',
    config = true
  }
}
