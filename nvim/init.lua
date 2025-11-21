local theme = require('config.options')
require('config.keymaps')
require('config.autocommands')
require('config.lazy')
require('config.lsp')

-- Cambiar el tema, tiene que ser después de cargar los plugins
vim.cmd('colorscheme ' .. theme)
