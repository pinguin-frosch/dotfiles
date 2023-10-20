return {
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
  end
}
