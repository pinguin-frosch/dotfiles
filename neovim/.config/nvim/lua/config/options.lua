-- Configuar la tecla líder
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Color del fondo del tema
vim.o.background = 'dark'

-- Ocultar barra de comandos
vim.o.cmdheight = 1

-- Activar barra de estado
vim.o.laststatus = 2

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
vim.o.listchars = 'tab:→ ,trail:·,space:·'

-- Configurar tamaño de tab en espacios
vim.o.tabstop = 4

-- Configurar el tamaño de espacios
vim.o.shiftwidth = 4

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
vim.o.updatetime = 300
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Activar colores de terminal
vim.o.termguicolors = true

-- Mantener un borde al bajar o subir
vim.o.scrolloff = 5

