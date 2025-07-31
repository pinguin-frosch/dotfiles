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
    end
}
