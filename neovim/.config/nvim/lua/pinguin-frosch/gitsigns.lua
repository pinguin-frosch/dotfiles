require('gitsigns').setup()

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<Leader>gn', ':Gitsigns next_hunk<CR>', opts)
vim.keymap.set('n', '<Leader>gr', ':Gitsigns reset_hunk<CR>', opts)
