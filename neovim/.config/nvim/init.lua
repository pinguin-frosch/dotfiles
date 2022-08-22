vim.opt.clipboard = 'unnamedplus'
vim.opt.mouse = 'a'
vim.opt.updatetime = 50
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.swapfile = false
vim.opt.smartindent = true
vim.opt.backup = false
vim.opt.relativenumber = true
vim.opt.signcolumn = 'auto:2'
vim.opt.colorcolumn = '80'
vim.opt.number = true
vim.opt.list = true
vim.opt.laststatus = 0
vim.opt.background = 'dark'
vim.opt.wrap = false
vim.opt.listchars = { space = '·', tab = '→ ' }
vim.opt.termguicolors = true
vim.g.mapleader = ' '
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.foldmethod = 'manual'

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<Esc>', ':nohl<CR>', opts)
vim.keymap.set('n', '<Leader><Leader>s', ':source %<CR>', opts)

vim.cmd [[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup='Visual', timeout=200})
augroup END
]]

require('pinguin-frosch.plugins')
require('pinguin-frosch.colorscheme')
require('pinguin-frosch.autopairs')
require('pinguin-frosch.comment')
require('pinguin-frosch.gitsigns')
require('pinguin-frosch.nvim-surround')
require('pinguin-frosch.nvim-tree')
require('pinguin-frosch.bufferline')
require('pinguin-frosch.telescope')
require('pinguin-frosch.treesitter')
require('pinguin-frosch.lsp')
require('pinguin-frosch.mason')
