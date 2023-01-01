vim.opt.clipboard = 'unnamedplus'
vim.opt.updatetime = 50
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.swapfile = false
vim.opt.smartindent = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.keymap.set('n', '<Esc>', ':nohl<CR>', opts)

if vim.g.vscode then
    require('pinguin-frosch.plugins')
    require('Comment').setup()
    require('nvim-surround').setup()

else
    -- Opciones
    vim.opt.mouse = 'a'
    vim.opt.backup = false
    vim.opt.signcolumn = 'auto:2'
    vim.opt.colorcolumn = '80'
    vim.opt.list = true
    vim.opt.laststatus = 0
    vim.opt.background = 'dark'
    vim.opt.wrap = false
    vim.opt.listchars = { space = '·', tab = '→ ' }
    vim.opt.termguicolors = true
    vim.g.mapleader = ' '
    vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
    vim.opt.foldmethod = 'manual'

    require('pinguin-frosch.plugins')

    -- Mappings
    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', '<Leader><Leader>s', ':source %<CR>', opts)
    vim.keymap.set('n', '<Leader><Leader>t', ':source $MYVIMRC<CR>', opts)
    vim.keymap.set('n', '<Leader>gn', ':Gitsigns next_hunk<CR>', opts)
    vim.keymap.set('n', '<Leader>gr', ':Gitsigns reset_hunk<CR>', opts)
    vim.keymap.set('n', '<Leader>e', ':NvimTreeToggle<CR>', opts)
    vim.keymap.set('n', '<M-k>', ':BufferLineCycleNext<CR>', opts)
    vim.keymap.set('n', '<M-j>', ':BufferLineCyclePrev<CR>', opts)
    vim.keymap.set('n', '<M-K>', ':BufferLineMoveNext<CR>', opts)
    vim.keymap.set('n', '<M-J>', ':BufferLineMovePrev<CR>', opts)
    vim.keymap.set('n', '<Leader>q', ':bdelete! %<CR>', opts)
    vim.keymap.set('n', '<C-p>', ':Telescope find_files<CR>', opts)
    vim.keymap.set('n', '<Leader><Leader>l', ':Telescope filetypes<CR>', { noremap = true })
    vim.keymap.set('n', '<Leader><Leader>h', ':TSBufToggle highlight<CR>', opts)

    -- Plugins sin configurar
    require('nvim-autopairs').setup {}
    require('Comment').setup()
    require('nvim-surround').setup()
    require('gitsigns').setup()
    require('nvim-tree').setup {}
    require('telescope').setup()
    require('mason').setup()
    require('mason-lspconfig').setup()

    -- Tema
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

    -- Bufferline
    require('bufferline').setup({
        options = {
            offsets = {
                { filetype = 'NvimTree', text = 'Explorador', text_align = 'center' }
            }
        }
    })

    -- Treesitter
    require('nvim-treesitter.configs').setup {
        ensure_installed = 'all',
        ignore_install = { 'phpdoc' },
        sync_install = false,
        highlight = {
            enable = true
        },
        rainbow = {
            enable = true,
            extended_mode = true
        },
        refactor = {
            highlight_definitions = {
                enable = true,
                clear_on_cursor_move = true
            }
        }
    }

    require('pinguin-frosch.lsp')

end
