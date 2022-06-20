require('plugins')
require('onedarkpro').load()
require('nvim-lsp-installer').setup {}
require('nvim-tree').setup {}
require('nvim-treesitter.configs').setup {
    ensure_installed = 'all',
    ignore_install = { 'phpdoc' },
    sync_install = false,
    highlight = {
        enable = true,
        disable = { 'html' }
    },
    indent = { enable = true }
}
require('telescope').setup {}
require('nvim-autopairs').setup {}
require('bufferline').setup {}
require('Comment').setup {}
require('surround').setup {
    mappings_style = "surround"
}
require('gitsigns').setup()

vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.updatetime = 300
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.list = true
vim.opt.listchars = { space = '·', tab = '→ ' }
vim.opt.termguicolors = true
vim.g.mapleader = " "
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<M-k>", ":BufferLineCycleNext<CR>", opts)
vim.keymap.set("n", "<M-j>", ":BufferLineCyclePrev<CR>", opts)
vim.keymap.set("n", "<M-K>", ":BufferLineMoveNext<CR>", opts)
vim.keymap.set("n", "<M-J>", ":BufferLineMovePrev<CR>", opts)
vim.keymap.set("n", "<Leader>q", ":bdelete! %<CR>", opts)
vim.keymap.set("n", "<Esc>", ":nohl<CR>", opts)
vim.keymap.set("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)
vim.keymap.set("n", "<C-p>", ":Telescope find_files<CR>", opts)

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<leader>df', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>db', vim.diagnostic.goto_prev, opts)
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

local settings = {}

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>c', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<leader>f', vim.lsp.buf.formatting, bufopts)
end

local servers = { 'sumneko_lua', 'html', 'pyright', 'clangd', 'tsserver', 'sqls', 'cssls' }
for _, lsp in pairs(servers) do
    if lsp == 'sumneko_lua' then
        settings = {
            Lua = {
                diagnostics = {
                    globals = { 'vim' }
                }
            }
        }
    end
    require('lspconfig')[lsp].setup {
        settings = settings,
        capabilities = capabilities,
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        }
    }
end

-- Setup nvim-cmp.
local cmp = require('cmp')
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true })
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
    })
})
