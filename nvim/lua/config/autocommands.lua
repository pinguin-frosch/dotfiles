-- Destacar texto al copiar
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Cerrar páginas de ayuda con q
local close_files = vim.api.nvim_create_augroup('CloseFiles', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    vim.keymap.set('n', 'q', '<cmd>q<cr>', { buffer = true, silent = true })
  end,
  group = close_files,
  pattern = 'help',
})

-- Quitar números en terminal
local no_numbers = vim.api.nvim_create_augroup('NoNumbers', { clear = true })
vim.api.nvim_create_autocmd('TermOpen', {
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
  group = no_numbers,
  pattern = '*',
})
