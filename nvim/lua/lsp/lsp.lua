local M = {}

M.setup_keymaps = function(bufnr)
  local nmap = function(keys, func, desc)
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end
  nmap('<leader>lr', vim.lsp.buf.rename, 'Rename')
  nmap('<leader>la', vim.lsp.buf.code_action, 'Code Actions')
  nmap('gd', vim.lsp.buf.definition, 'Goto Definition')
  nmap('gr', require('telescope.builtin').lsp_references, 'Goto References')
  nmap('gI', vim.lsp.buf.implementation, 'Goto Implementation')
  nmap('gD', vim.lsp.buf.type_definition, 'Goto Type Definition')
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
  nmap('<leader>lwa', vim.lsp.buf.add_workspace_folder, 'Add Folder')
  nmap('<leader>lwr', vim.lsp.buf.remove_workspace_folder, 'Remove Folder')
  nmap('<leader>lwl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, 'List Folders')
  nmap('<leader>lf', function()
    vim.lsp.buf.format({ async = true })
  end, 'Format File')
  nmap('<leader>ldo', vim.diagnostic.open_float, 'Open Floating Window')
  nmap('<leader>lds', vim.diagnostic.setloclist, 'Set Local List')
end

M.capabilities = require('cmp_nvim_lsp').default_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true

return M
