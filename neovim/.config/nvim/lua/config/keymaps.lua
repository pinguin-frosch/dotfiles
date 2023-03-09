-- Atajo para cambiar alternar el color del fondo
vim.keymap.set('n', '<leader>tb', function()
  if (vim.o.background == 'dark') then
    vim.o.background = 'light'
  else
    vim.o.background = 'dark'
  end
end, { desc = '[T]oggle [B]ackground color' })

-- Atajo para activar o desactivar la barra de comandos
local function toggle_command_line()
  if (vim.o.cmdheight == 1) then
    vim.o.cmdheight = 0
  else
    vim.o.cmdheight = 1
  end
end
vim.keymap.set('n', '<leader>tc', function()
  toggle_command_line()
end, { desc = '[T]oggle [C]ommand line' })

-- Atajo para activar o desactivar la barra de estado
local function toggle_status_bar()
  if (vim.o.laststatus == 2) then
    vim.o.laststatus = 0
  else
    vim.o.laststatus = 2
  end
end
vim.keymap.set('n', '<leader>ts', function()
  toggle_status_bar()
end, { desc = '[T]oggle [S]tatus bar' })

-- Atajo para activar o desactivar word wrap
vim.keymap.set('n', '<leader>tw', function()
  vim.o.wrap = not vim.o.wrap
end, { desc = '[T]oggle word [W]rap' })

-- Atajo para desactivar el coloreado después de buscar
vim.keymap.set('n', '<Esc>', function()
  vim.cmd('nohl')
end, { desc = 'Hide highlighting after searching', silent = true })

-- Atajo para activar o desactivar los números
local function toggle_number_line()
  vim.wo.number = not vim.wo.number
  vim.wo.relativenumber = not vim.wo.relativenumber
end
vim.keymap.set('n', '<leader>tn', function()
  toggle_number_line()
end, { desc = '[T]oggle line [N]umbers' })

-- Atajo para activar o desactivar la barra de íconos (símbolos)
local function toggle_sign_column()
  if (vim.wo.signcolumn == 'yes') then
    vim.wo.signcolumn = 'no'
  else
    vim.wo.signcolumn = 'yes'
  end
end
vim.keymap.set('n', '<leader>ti', function()
  toggle_sign_column()
end, { desc = '[T]oggle s[I]gn column' })

-- Atajo para desactivar todos los elementos de la pantalla
vim.keymap.set('n', '<leader>tz', function()
  toggle_command_line()
  toggle_status_bar()
  toggle_number_line()
  toggle_sign_column()
end, { desc = '[T]oggle [Z]en mode' })

-- Desactivar el espacio en normal y visual
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Mejorar experiencia con texto que rompe la pantalla
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

