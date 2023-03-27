return {
  {
    'L3MON4D3/LuaSnip',
    event = 'InsertEnter',
    dependencies = { 'rafamadriz/friendly-snippets' },
    config = function()
      local luasnip = require('luasnip')
      require('luasnip.loaders.from_vscode').lazy_load()
      vim.keymap.set({ 'i', 's' }, '<C-k>', function()
        if luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        end
      end, { silent = true })
      vim.keymap.set({ 'i', 's' }, '<C-j>', function()
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        end
      end, { silent = true })
      vim.keymap.set({ 'i', 's' }, '<C-l>', function()
        if luasnip.choice_active() then
          luasnip.change_choice(1)
        end
      end, { silent = true })
    end,
  },
  {
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
        formatting = {
          format = require('lspkind').cmp_format({ maxwidth = 50 }),
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
    end,
  }
}
