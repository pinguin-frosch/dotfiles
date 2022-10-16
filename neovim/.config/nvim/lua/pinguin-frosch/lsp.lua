local cmp = require('cmp')
local luasnip = require('luasnip')
local lspkind = require('lspkind')

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
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
        { name = 'buffer', keyword_length = 4 },
        { name = 'path' },
    }),
    completion = {
        completeopt = 'menu,menuone,noinsert',
    },
})

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<Leader>c', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float, bufopts)
    vim.keymap.set('n', '<Leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
    vim.keymap.set('n', '<Leader>r', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<Leader>df', vim.diagnostic.goto_next, bufopts)
    vim.keymap.set('n', '<Leader>db', vim.diagnostic.goto_prev, bufopts)
    vim.keymap.set('n', '<Leader><Leader>dh', vim.diagnostic.hide, bufopts)
    vim.keymap.set('n', '<Leader><Leader>ds', vim.diagnostic.show, bufopts)
end

local servers = { 'pyright', 'tsserver', 'gopls', 'html', 'cssls', 'jsonls', 'yamlls', 'bashls', 'sqls', 'emmet_ls', 'jdtls', 'clangd' }
for _, lsp in pairs(servers) do
    require('lspconfig')[lsp].setup {
        capabilities = capabilities,
        root_dir = function() return vim.loop.cwd() end,
        on_attach = on_attach,
        flags = {
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
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150,
    }
}
