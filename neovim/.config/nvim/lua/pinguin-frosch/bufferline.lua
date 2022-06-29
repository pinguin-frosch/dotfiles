require('bufferline').setup({
    options = {
        diagnostics = 'nvim_lsp',
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function (count, level, diagnostics_dict, context)
            local icon = level:match('error') and ' ' or ' '
            return icon .. count
        end,
        offsets = {
            { filetype = 'NvimTree', text = 'Explorador', text_align = 'center' }
        }
    }
})

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<M-k>', ':BufferLineCycleNext<CR>', opts)
vim.keymap.set('n', '<M-j>', ':BufferLineCyclePrev<CR>', opts)
vim.keymap.set('n', '<M-K>', ':BufferLineMoveNext<CR>', opts)
vim.keymap.set('n', '<M-J>', ':BufferLineMovePrev<CR>', opts)
vim.keymap.set('n', '<Leader>q', ':bdelete! %<CR>', opts)
