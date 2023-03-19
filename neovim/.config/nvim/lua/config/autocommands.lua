-- Destacar texto al copiar
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

local big_file_group = vim.api.nvim_create_augroup('BigFile', { clear = true })
vim.api.nvim_create_autocmd('BufReadPre', {
  callback = function()
    local max_size = 100 * 1024 -- 100 KB
    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()))
    if ok and stats and stats.size > max_size then
      vim.b.big_file = true
      return true
    end
  end,
  group = big_file_group,
  pattern = '*',
})
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    if vim.b.big_file then
      print('Big file detected, syntax highlighting disabled for performance reasons.')
      vim.cmd('syntax off')
    end
  end,
  group = big_file_group,
  pattern = '*',
})

