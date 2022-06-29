local cmp = require('cmp')
local lspkind = require('lspkind')

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
        ['<CR>'] = cmp.mapping.confirm({ select = true })
    }),
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text',
            menu = ({
                buffer = '[Buffer]',
                nvim_lsp = '[LSP]',
                luasnip = '[Snippet]',
                nvim_lua = '[Lua]',
                path = '[Path]'
            })
        }),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'nvim_lua' },
        { name = 'buffer' },
        { name = 'path' },
    }),
})

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gd', ':Telescope lsp_definitions<CR>', bufopts)
    vim.keymap.set('n', 'gr', ':Telescope lsp_references<CR>', bufopts)
    vim.keymap.set('n', 'gi', ':Telescope lsp_implementations<CR>', bufopts)
    vim.keymap.set('n', '<Leader>D', ':Telescope lsp_type_definitions<CR>', bufopts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<Leader>r', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<Leader>c', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<Leader>f', vim.lsp.buf.formatting, bufopts)
    vim.keymap.set('n', '<Leader>df', vim.diagnostic.goto_next, bufopts)
    vim.keymap.set('n', '<Leader>db', vim.diagnostic.goto_prev, bufopts)
    vim.keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<Leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<Leader><Leader>dh', vim.diagnostic.hide, bufopts)
    vim.keymap.set('n', '<Leader><Leader>ds', vim.diagnostic.show, bufopts)
end

local servers = { 'pyright', 'tsserver', 'gopls' }
for _, lsp in pairs(servers) do
    require('lspconfig')[lsp].setup {
        capabilities = capabilities,
        root_dir = function() return vim.loop.cwd() end,
        on_attach = on_attach, flags = {
            debounce_text_changes = 150,
        }
    }
end

require('lspconfig').sumneko_lua.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        },
    },
    on_attach = on_attach, flags = {
        debounce_text_changes = 150,
    }
}
