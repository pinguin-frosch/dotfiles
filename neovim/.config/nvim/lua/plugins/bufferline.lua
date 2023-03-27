return {
  -- Barra con los buffers
  'akinsho/bufferline.nvim',
  event = { 'BufReadPre', 'BufNewFile', 'BufWinEnter' },
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  config = function()
    require('bufferline').setup()
    vim.keymap.set('n', '<M-j>', function()
      vim.cmd('BufferLineCyclePrev')
    end, { silent = true })
    vim.keymap.set('n', '<M-k>', function()
      vim.cmd('BufferLineCycleNext')
    end, { silent = true })
    vim.keymap.set('n', '<M-J>', function()
      vim.cmd('BufferLineMovePrev')
    end, { silent = true })
    vim.keymap.set('n', '<M-K>', function()
      vim.cmd('BufferLineMoveNext')
    end, { silent = true })
    vim.keymap.set('n', '<leader>bc', function()
      vim.cmd('bdelete')
    end, { silent = true })
    vim.keymap.set('n', '<leader>bC', function()
      vim.cmd('bdelete!')
    end, { silent = true })
  end,
}
