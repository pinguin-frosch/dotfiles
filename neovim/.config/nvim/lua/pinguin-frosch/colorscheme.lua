local onedarkpro = require('onedarkpro')
onedarkpro.setup({
    theme = function()
        if vim.o.background == 'dark' then
            return 'onedark'
        else
            return 'onelight'
        end
    end,
})
onedarkpro.load()

local opts = { silent = true, noremap = true }
vim.keymap.set('n', '<Leader><Leader>td', ':set background=dark<CR>', opts)
vim.keymap.set('n', '<Leader><Leader>tl', ':set background=light<CR>', opts)
