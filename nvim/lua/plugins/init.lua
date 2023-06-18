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

  -- Manejar cambios en líneas temporales
  {
    'mbbill/undotree',
    config = function()
      vim.keymap.set('n', '<leader>u', ':UndotreeToggle<CR>')
    end
  },

  'tpope/vim-sleuth',
  'brenoprata10/nvim-highlight-colors',
  'b0o/SchemaStore.nvim',
  'folke/neodev.nvim'
}
