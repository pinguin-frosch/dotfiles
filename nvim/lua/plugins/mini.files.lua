return {
    "echasnovski/mini.files",
    version = "*",
    config = function()
        local files = require('mini.files')
        files.setup({
            windows = {
                width_focus = 80
            }
        })
        vim.keymap.set('n', '<leader>e', function()
            files.open()
        end, { desc = 'Open File Explorer' })
        vim.keymap.set('n', '-', function()
            local mini = require('mini.files')
            local _ = mini.close() or mini.open(vim.api.nvim_buf_get_name(0), false)
            vim.schedule(function()
                mini.reveal_cwd()
            end)
        end, { desc = 'Open File Explorer In Current File' })
    end
}
