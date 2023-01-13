-- Instalar packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
  -- Gestor de paquetes
  use 'wbthomason/packer.nvim'

  use { -- Destacar, editar y navegar código
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }

  use { -- Más textobjects usando treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  use 'navarasu/onedark.nvim' -- Tema inspirado por Atom
  use 'numToStr/Comment.nvim' -- Mejor forma de comentar
  use 'kylechui/nvim-surround' -- Modificar delimitadores

  if is_bootstrap then
    require('packer').sync()
  end
end)

-- No tiene sentido ejecutar el resto del código si se
-- están instalando los paquetes. Hay que esperar y al
-- reiniciar neovim funcionará.
if is_bootstrap then
  print '=================================='
  print '  Se está instalando los plugins  '
  print '  Espere mientras Packer termina  '
  print '   Al finalizar reinicie neovim   '
  print '=================================='
  return
end

-- Usar el portapapeles del sistema
vim.o.clipboard = 'unnamedplus'

-- Desactivar el destacado al buscar
vim.o.hlsearch = false

-- Mostrar la barra de números 
vim.wo.number = true

-- Habilitar el mouse
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Búsqueda insensitiva a menos que haya mayúsculas o \C
vim.o.ignorecase = true
vim.o.smartcase = true

-- Reducir el tiempo de actualización
vim.o.updatetime = 250

-- Fondo para indicar el tema a usar
vim.o.background = 'dark'

-- Activar el tema
vim.o.termguicolors = true
vim.cmd [[colorscheme onedark]]

-- Configurar la tecla leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- No hacer nada al pulsar espacio
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Releer la configuración de neovim
vim.keymap.set('n', '<Leader><Leader>r', ':source $MYVIMRC<CR>', { silent = true })

-- Destacar al copiar
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Activar Comment.nvim
require('Comment').setup()

-- Activar nvim-surround
require('nvim-surround').setup()

-- Configurar treesitter
require('nvim-treesitter.configs').setup {
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- Guardar los saltos en la lista de saltos
      goto_next_start = {
        ['>f'] = '@function.outer',
        ['>c'] = '@class.outer',
      },
      goto_next_end = {
        ['>F'] = '@function.outer',
        ['>C'] = '@class.outer',
      },
      goto_previous_start = {
        ['<f'] = '@function.outer',
        ['<c'] = '@class.outer',
      },
      goto_previous_end = {
        ['<F'] = '@function.outer',
        ['<C'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
}

