return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'saadparwaiz1/cmp_luasnip',
    'onsails/lspkind.nvim'
  },
  opts = function()
    local cmp = require('cmp')

    -- Agregar paréntesis al completar funciones u otros
    cmp.event:on('confirm_done', require('nvim-autopairs.completion.cmp').on_confirm_done())

    return {
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      preselect = cmp.PreselectMode.None,
      formatting = {
        format = require('lspkind').cmp_format({
          maxwidth = 50,
          mode = 'symbol'
        }),
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
      })
    }
  end
}
