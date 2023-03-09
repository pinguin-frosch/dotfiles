return {
    {
        'lewis6991/gitsigns.nvim',
        event = 'BufReadPost',
        config = true
    },
    {
        'github/copilot.vim',
        config = function()
            vim.g.copilot_assume_mapped = true
        end,
    }
}
