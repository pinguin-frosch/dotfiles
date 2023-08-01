-- Atajo para activar o desactivar word wrap
vim.keymap.set('n', '<leader>tw', function()
  vim.o.wrap = not vim.o.wrap
  print('Word Wrap ' .. (vim.o.wrap and 'enabled' or 'disabled'))
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
    print('Copilot disabled')
  else
    vim.cmd('Copilot enable')
    print('Copilot enabled')
  end
  active = not active
end, { desc = 'Toggle Copilot' })

-- Desactivar el espacio en normal y visual
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

