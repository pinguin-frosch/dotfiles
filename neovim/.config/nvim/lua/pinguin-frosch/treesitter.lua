require('nvim-treesitter.configs').setup {
    ensure_installed = 'all',
    ignore_install = { 'phpdoc' },
    sync_install = false,
    highlight = {
        enable = true,
        disable = { 'html', 'json' }
    },
    indent = { enable = true }
}
