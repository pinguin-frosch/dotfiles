require('nvim-treesitter.configs').setup {
    ensure_installed = 'all',
    sync_install = false,
    highlight = {
        enable = true
    },
    indent = {
        enable = true
    }
}

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<Leader><Leader>h', ':TSBufToggle highlight<CR>', opts)
