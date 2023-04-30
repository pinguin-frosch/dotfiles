return {
  'nvim-telescope/telescope.nvim',
  version = '*',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup({
      pickers = {
        find_files = {
          find_command = { 'rg', '--files', '--hidden', '--glob', '!**/.git/*' },
        }
      }
    })
    vim.keymap.set('n', '<leader>sf', '<CMD>Telescope find_files<CR>', { desc = 'Search files' })
    vim.keymap.set('n', '<leader>sg', '<CMD>Telescope live_grep<CR>', { desc = 'Search by Grep' })
    vim.keymap.set('n', '<leader>ss', '<CMD>Telescope lsp_document_symbols<CR>', { desc = 'Search symbols in buffer' })
    vim.keymap.set('n', '<leader>sS', '<CMD>Telescope lsp_workspace_symbols<CR>', { desc = 'Search symbols in workspace' })
    vim.keymap.set('n', '<leader>sc', '<CMD>Telescope resume<CR>', { desc = 'Continue last search' })
  end,
}
