return {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
        cmdline = { enabled = false },
        completion = {
            ghost_text = { enabled = false },
        },
        term = { enabled = false },
        keymap = { preset = 'enter' },
    },
}
