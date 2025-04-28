return {
  'folke/which-key.nvim',
  config = function()
    require('which-key').setup({
      delay = 300,
      icons = {
        mappings = false
      },
    })
    local wk = require('which-key')
    wk.add({
      { '<leader>b',  group = 'Buffers' },
      { '<leader>g',  group = 'Git' },
      { '<leader>h',  group = 'Harpoon' },
      { '<leader>l',  group = 'LSP' },
      { '<leader>ld', group = 'Diagnostics' },
      { '<leader>ls', group = 'Server' },
      { '<leader>lw', group = 'Workspace' },
      { '<leader>s',  group = 'Search' },
      { '<leader>t',  group = 'Toggles' },
    })
  end,
}
