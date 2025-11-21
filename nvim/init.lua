local theme = require('config.options')
require('config.keymaps')
require('config.autocommands')

-- Instalar el gestor de paquetes
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- Cargar plugins y cambiar el tema de lazy
require('lazy').setup('plugins', {
  install = {
    colorscheme = { theme }
  },
  change_detection = {
    notify = false
  }
})

require('core.lsp')

-- Cambiar el tema, tiene que ser después de cargar los plugins
vim.cmd('colorscheme ' .. theme)
