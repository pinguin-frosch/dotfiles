-- Atajo para activar o desactivar word wrap
vim.keymap.set('n', '<leader>tw', function()
  vim.o.wrap = not vim.o.wrap
  print('Word Wrap ' .. (vim.o.wrap and 'enabled' or 'disabled'))
end, { desc = 'Toggle word Wrap' })

-- Atajo para desactivar el coloreado después de buscar
vim.keymap.set('n', '<Esc>', function()
  vim.cmd('nohl')
end, { desc = 'Hide highlighting after searching', silent = true })

-- Desactivar el espacio en normal y visual
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Atajos para usar neovim ignorando mi distribución de teclado
vim.keymap.set('n', 'ü', '[', { remap = true })
vim.keymap.set('n', '+', ']', { remap = true })

-- Atajos globales de diagnósticos
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>do', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>ds', vim.diagnostic.setloclist)
