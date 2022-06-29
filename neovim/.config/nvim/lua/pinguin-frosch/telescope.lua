require('telescope').setup {}

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<C-p>', ':Telescope find_files<CR>', opts)
vim.keymap.set('n', '<Leader><Leader>l', ':Telescope filetypes<CR>', { noremap = true })
