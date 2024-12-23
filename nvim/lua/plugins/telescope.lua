return {
  'nvim-telescope/telescope.nvim',
  version = '*',
  dependencies = { 'nvim-lua/plenary.nvim' },
  cmd = 'Telescope',
  keys = {
    { '<Leader>sd', '<Cmd>Telescope diagnostics<CR>', desc = 'Search diagnostics in workspace' },
    { '<Leader>sf', '<Cmd>Telescope find_files<CR>', desc = 'Search files' },
    { '<Leader>sg', '<Cmd>Telescope live_grep<CR>', desc = 'Search by Grep' },
    { '<Leader>ss', '<Cmd>Telescope lsp_document_symbols<CR>', desc = 'Search symbols in buffer' },
    { '<Leader>sS', '<Cmd>Telescope lsp_dynamic_workspace_symbols<CR>', desc = 'Search symbols in workspace' },
    { '<Leader>sr', '<Cmd>Telescope resume<CR>', desc = 'Resume last search' },
    { '<Leader>sc', '<Cmd>Telescope git_status<CR>', desc = 'Search changed files' },
  },
  opts = {
    pickers = {
      find_files = {
        find_command = { 'rg', '--files', '--hidden', '--glob', '!**/.git/*' },
      }
    }
  }
}
