return {
  'nvim-telescope/telescope.nvim',
  version = '*',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    pickers = {
      find_files = {
        find_command = { 'rg', '--files', '--hidden', '--glob', '!**/.git/*' },
      }
    }
  },
  config = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = 'Buffers' })
    vim.keymap.set('n', '<leader>sc', builtin.git_status, { desc = 'Changed Git Files' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = 'Diagnostics In Workspace' })
    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Files' })
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'By Grep' })
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = 'Resume Last Search' })
    vim.keymap.set('n', '<leader>ss', builtin.lsp_document_symbols, { desc = 'LSP Symbols In Buffer' })
    vim.keymap.set('n', '<leader>sS', builtin.lsp_dynamic_workspace_symbols, { desc = 'LSP Symbols In Workspace' })
  end,
}
