return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'saadparwaiz1/cmp_luasnip',
  },
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local cmp = require('cmp')
    local types = require('cmp.types')
    local icons = require('mini.icons')
    local luasnip = require('luasnip')

    local function deprioritize_lsp_snippets(entry1, entry2)
      if entry1:get_kind() == types.lsp.CompletionItemKind.Snippet then return false end
      if entry2:get_kind() == types.lsp.CompletionItemKind.Snippet then return true end
    end

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
      }),
      sorting = {
        priority_weight = 2,
        comparators = {
          deprioritize_lsp_snippets,
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.scopes,
          cmp.config.compare.score,
          cmp.config.compare.recently_used,
          cmp.config.compare.locality,
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      },
      completion = {
        completeopt = 'menu,menuone,preview',
      },
      formatting = {
        fields = { 'kind', 'abbr' },
        format = function(_, vim_item)
          local icon, hl = icons.get('lsp', vim_item.kind)
          vim_item.kind = icon
          vim_item.kind_hl_group = hl
          return vim_item
        end,
      },
      preselect = cmp.PreselectMode.None,
      mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping(function(fallback)
          if not cmp.visible() then
            fallback()
          end
          if luasnip.expandable() then
            luasnip.expand()
          else
            cmp.confirm({ select = true })
          end
        end),
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            fallback()
          elseif luasnip.locally_jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            fallback()
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      }),
    })
  end
}
