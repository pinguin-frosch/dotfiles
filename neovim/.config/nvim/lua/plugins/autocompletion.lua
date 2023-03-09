return {
  {
    'L3MON4D3/LuaSnip',
    event = 'InsertEnter',
    dependencies = {
      'rafamadriz/friendly-snippets',
      config = function()
        require('luasnip.loaders.from_vscode').lazy_load()
      end,
    },
    config = true,
  },
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
    },
    opts = function()
      local cmp = require('cmp')

      -- Agregar paréntesis al completar funciones u otros
      cmp.event:on('confirm_done', require('nvim-autopairs.completion.cmp').confirm_done)

      return {
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        completion = {
          completeopt = 'menu,menuone,noinsert',
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'path' },
        },
        mapping = cmp.mapping.preset.insert({
              ['<C-e>'] = cmp.mapping.close(),
              ['<C-f>'] = cmp.mapping.scroll_docs(4),
              ['<C-b>'] = cmp.mapping.scroll_docs(-4),
              ['<C-Space>'] = cmp.mapping.complete(),
              ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }),
              ['<Tab>'] = cmp.mapping(function(fallback)
            if require('luasnip').expand_or_jumpable() then
              require('luasnip').expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
              ['<S-Tab>'] = cmp.mapping(function(fallback)
            if require('luasnip').jumpable(-1) then
              require('luasnip').jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        })
      }
    end,
  }
}
