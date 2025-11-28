local servers = { 'ts_ls', 'clangd', 'gopls', 'pyright', 'rust_analyzer', 'dockerls', 'docker_compose_language_service',
  'bashls', 'cssls', 'html', 'jsonls', 'svelte', 'lua_ls', 'emmet_language_server' }
vim.lsp.enable(servers)

-- Quitar atajos por defecto de lsp
vim.keymap.del('n', 'gra')
vim.keymap.del('n', 'gri')
vim.keymap.del('n', 'grn')
vim.keymap.del('n', 'grr')
vim.keymap.del('n', 'grt')
vim.keymap.del('n', 'gO')

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('LspKeymaps', { clear = true }),
  callback = function(ev)
    local nmap = function(keys, func, desc)
      vim.keymap.set('n', keys, func, { buffer = ev.buf, desc = desc })
    end
    nmap('<leader>lr', function()
      vim.lsp.buf.rename()
      vim.cmd('silent! wa')
    end, 'Rename')
    nmap('<leader>la', vim.lsp.buf.code_action, 'Code Actions')
    nmap('gd', vim.lsp.buf.definition, 'Goto Definition')
    nmap('gr', function()
      require('mini.extra').pickers.lsp({ scope = 'references' })
    end, 'Goto References')
    nmap('gI', vim.lsp.buf.implementation, 'Goto Implementation')
    nmap('gD', vim.lsp.buf.type_definition, 'Goto Type Definition')
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
    nmap('<leader>lf', function()
      vim.lsp.buf.format({ async = true })
    end, 'Format File')
  end
})
