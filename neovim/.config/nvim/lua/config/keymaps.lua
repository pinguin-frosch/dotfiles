-- Atajo para activar o desactivar word wrap
vim.keymap.set('n', '<leader>tw', function()
  vim.o.wrap = not vim.o.wrap
end, { desc = 'Toggle word Wrap' })

-- Atajo para desactivar el coloreado después de buscar
vim.keymap.set('n', '<Esc>', function()
  vim.cmd('nohl')
end, { desc = 'Hide highlighting after searching', silent = true })

-- Atajo para alternar el estado de Copilot
local active = true
vim.keymap.set('n', '<leader>tc', function()
  if active then
    vim.cmd('Copilot disable')
  else
    vim.cmd('Copilot enable')
  end
  active = not active
end, { desc = 'Toggle Copilot' })

-- Desactivar el espacio en normal y visual
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

