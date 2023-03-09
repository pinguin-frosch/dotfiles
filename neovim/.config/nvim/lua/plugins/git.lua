return {
    {
        'lewis6991/gitsigns.nvim',
        event = 'BufReadPost',
        config = true
    },
    {
        'github/copilot.vim',
        event = 'InsertEnter',
        config = function()
            vim.g.copilot_assume_mapped = true
        end,
    }
}
