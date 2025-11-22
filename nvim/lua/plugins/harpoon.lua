return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        '<leader>hm', '<leader>hh', '<leader>ha', '<leader>hs', '<leader>hd', '<leader>hf', '<leader>hg', '<leader>hr'
    },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()

        vim.keymap.set("n", "<leader>hm", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = "Open Harpoon Menu" })
        vim.keymap.set("n", "<leader>hh", function()
            harpoon:list():add()
        end, { desc = "Add File To Harpoon" })
        vim.keymap.set("n", "<leader>ha", function()
            harpoon:list():select(1)
        end, { desc = "Open Harpoon File 1" })
        vim.keymap.set("n", "<leader>hs", function()
            harpoon:list():select(2)
        end, { desc = "Open Harpoon File 2" })
        vim.keymap.set("n", "<leader>hd", function()
            harpoon:list():select(3)
        end, { desc = "Open Harpoon File 3" })
        vim.keymap.set("n", "<leader>hf", function()
            harpoon:list():select(4)
        end, { desc = "Open Harpoon File 4" })
        vim.keymap.set("n", "<leader>hg", function()
            harpoon:list():select(5)
        end, { desc = "Open Harpoon File 5" })
        vim.keymap.set('n', '<leader>hr', function()
            local list = harpoon:list()
            for i, _ in ipairs(list.items) do
                harpoon:list():remove_at(i)
            end
        end, { desc = 'Reset Harpoon List' })
    end
}
