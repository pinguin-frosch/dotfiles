return {
  -- Barra con los buffers
  'akinsho/bufferline.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  config = true,
  keys = {
    {
      '<M-j>',
      function()
        vim.cmd('BufferLineCyclePrev')
      end,
      desc = 'Move to previous buffer'
    },
    {
      '<M-k>',
      function()
        vim.cmd('BufferLineCycleNext')
      end,
      desc = 'Move to next buffer'
    },
    {
      '<M-J>',
      function()
        vim.cmd('BufferLineMovePrev')
      end,
      desc = 'Swap with previous buffer'
    },
    {
      '<M-K>',
      function()
        vim.cmd('BufferLineMoveNext')
      end,
      desc = 'Swap with next buffer'
    },
    {
      '<leader>bc',
      function()
        vim.cmd('bdelete')
      end,
      desc = 'Close current buffer'
    },
  },
}
