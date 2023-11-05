-- Configuar la tecla líder
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Color del fondo del tema
vim.o.background = 'light'

-- Tema del editor
local theme = 'catppuccin'

-- Ocultar barra de comandos
vim.o.cmdheight = 1

-- Activar barra de estado global
vim.o.laststatus = 3

-- Destacar la línea en uso
vim.o.cursorline = true

-- No cortar las líneas por defecto
vim.o.wrap = false

-- Destacar al buscar
vim.o.hlsearch = true

-- Usar números relativos
vim.wo.number = true
vim.wo.relativenumber = true

-- Activar la columna de símbolos
vim.wo.signcolumn = 'yes'

-- Mostrar íconos para espacios, tabs, entre otros
vim.o.list = true
vim.o.listchars = 'tab:→ ,trail:·,space:·,extends:»,precedes:«'

-- Configurar tamaño de tab en espacios
vim.o.tabstop = 4

-- Configurar el tamaño de espacios
vim.o.shiftwidth = 4

-- Configurar el tamaño de cada <Tab>
vim.o.softtabstop = 4

-- Auto indent
vim.o.autoindent = true

-- Usar espacios en vez de tabs
vim.o.expandtab = true

-- Activar el mouse
vim.o.mouse = 'a'

-- Sincronizar el portapapeles entre el sistema y neovim
vim.o.clipboard = 'unnamedplus'

-- Activar break indent
vim.o.breakindent = true

-- Guardar el historial de archivos
vim.o.undofile = true

-- Ignorar mayúsculas a menos que se use /C al buscar
vim.o.ignorecase = true
vim.o.smartcase = true

-- Disminuir el tiempo de actualización
vim.o.updatetime = 100
vim.o.timeoutlen = 1000

-- No guardar archivos de backup
vim.o.backup = false
vim.o.writebackup = false

-- No guardar archivos de swap
vim.o.swapfile = false

-- No mostrar el modo
vim.o.showmode = false

-- Limitar opciones de autocompletado
vim.o.pumheight = 15

-- Activar colores de terminal
vim.o.termguicolors = true

-- Mantener un borde al bajar o subir
vim.o.scrolloff = 5
vim.o.sidescrolloff = 5

-- Barra de estado casi por defecto
vim.o.statusline = '%-(%{get(b:,"gitsigns_head","")} %)%<%t %h%m%r%=%-14.(%l,%c%V%) %P'

return theme
