require('nvim-tree').setup {}

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<Leader>e', ':NvimTreeToggle<CR>', opts)
