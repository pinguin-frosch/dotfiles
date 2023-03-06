-- Configuar la tecla líder
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Color del fondo del tema
vim.o.background = 'dark'

-- Atajo para cambiar alternar el color del fondo
vim.keymap.set('n', '<leader>tb', function()
  if (vim.o.background == 'dark') then
    vim.o.background = 'light'
  else
    vim.o.background = 'dark'
  end
end, { desc = '[T]oggle [B]ackground color' })

-- Ocultar barra de comandos
vim.o.cmdheight = 1

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

-- Activar barra de estado
vim.o.laststatus = 2

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

-- No cortar las líneas por defecto
vim.o.wrap = false

-- Atajo para activar o desactivar word wrap
vim.keymap.set('n', '<leader>tw', function()
  vim.o.wrap = not vim.o.wrap
end, { desc = '[T]oggle word [W]rap' })

-- Destacar al buscar
vim.o.hlsearch = true

-- Atajo para desactivar el coloreado después de buscar
vim.keymap.set('n', '<Esc>', function()
  vim.cmd('nohl')
end, { desc = 'Hide highlighting after searching', silent = true })

-- Usar números relativos
vim.wo.number = true
vim.wo.relativenumber = true

-- Atajo para activar o desactivar los números
local function toggle_number_line()
  vim.wo.number = not vim.wo.number
  vim.wo.relativenumber = not vim.wo.relativenumber
end
vim.keymap.set('n', '<leader>tn', function()
  toggle_number_line()
end, { desc = '[T]oggle line [N]umbers' })

-- Activar la columna de símbolos
vim.wo.signcolumn = 'yes'

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

-- Mostrar íconos para espacios, tabs, entre otros
vim.o.list = true
vim.o.listchars = 'tab:→ ,trail:·,space:·'

-- Configurar tamaño de tab en espacios
vim.o.tabstop = 4

-- Configurar el tamaño de espacios
vim.o.shiftwidth = 4

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

-- Desactivar el espacio en normal y visual
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Mejorar experiencia con texto que rompe la pantalla
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Destacar texto al copiar
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

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

-- Configurar los plugins
require('lazy').setup({
  -- Plugins de git
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Github Copilot
  {
    'github/copilot.vim',
    config = function()
      -- Permite usar Tab para los snippets y copilot
      vim.g.copilot_assume_mapped = true
      local enabled = true

      -- Atajo para activar o desactivar Github Copilot
      vim.keymap.set('n', '<leader>tg', function()
        if enabled then
          vim.cmd('Copilot disable')
          print('Copilot disabled')
          enabled = false
        else
          vim.cmd('Copilot enable')
          print('Copilot enabled')
          enabled = true
        end
      end, { desc = '[T]oggle [G]ithub Copilot' })
    end
  },

  -- Detectar tabstop y shiftwidth automáticamente
  'tpope/vim-sleuth',

  {
    -- Plugins de LSP
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Instalar LSPs en stdpath automáticamente
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Configuración adicional de lua, mejora neovim
      'folke/neodev.nvim',
    },
  },

  {
    -- Autocompletado
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  },

  -- Muestra autocompletado para atajos pendientes
  { 'folke/which-key.nvim',          opts = {} },
  {
    -- Añade los símbolos para indicar los cambios en git
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  {
    -- Tema inspirado por Atom
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'onedark'
    end,
  },

  {
    -- Explorador de archivos
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
    config = function()
      require('nvim-tree').setup()
      vim.keymap.set('n', '<leader>e', function()
        vim.cmd('NvimTreeToggle')
      end, { desc = 'Open File [E]xplorer' })
    end
  },

  {
    -- Barra con los buffers
    'akinsho/bufferline.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('bufferline').setup()

      -- Atajos para navegar
      vim.keymap.set('n', '<M-j>', function()
        vim.cmd('BufferLineCyclePrev')
      end, { desc = 'Move to previous buffer' })
      vim.keymap.set('n', '<M-k>', function()
        vim.cmd('BufferLineCycleNext')
      end, { desc = 'Move to next buffer' })
      vim.keymap.set('n', '<M-J>', function()
        vim.cmd('BufferLineMovePrev')
      end, { desc = 'Move to previous buffer' })
      vim.keymap.set('n', '<M-K>', function()
        vim.cmd('BufferLineMoveNext')
      end, { desc = 'Move to next buffer' })
      vim.keymap.set('n', '<leader>cb', function()
        vim.cmd('bdelete')
      end, { desc = 'Close [C]urrent [B]uffer ' })
    end,
  },

  {
    -- Activar lualine como línea de estado
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
        disabled_filetypes = { 'NvimTree' },
      },
    },
  },

  -- Plugin para comentar según tipo de archivo
  { 'numToStr/Comment.nvim',         opts = {} },

  -- Plugin para modificar los delimitadores
  { 'kylechui/nvim-surround',        opts = {} },

  -- Autocerrar pares
  { 'windwp/nvim-autopairs',         opts = {} },

  -- Plugin para buscar archivos, entre otras cosas
  { 'nvim-telescope/telescope.nvim', version = '*', dependencies = { 'nvim-lua/plenary.nvim' } },
  {
    -- Destacar, editar y navigar el código
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'p00f/nvim-ts-rainbow'
    },
    opts = {}
  },
}, {})

-- [[ Configurar Telescope ]]
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
      },
    },
  },
}

vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<C-p>', function()
  local is_git = os.execute('git') == 0
  if is_git then
    require('telescope.builtin').git_files()
  else
    require('telescope.builtin').find_files()
  end
end, { desc = 'File picker, only git files if in a git repo' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

require('nvim-treesitter.configs').setup {
  ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'typescript', 'help', 'vim' },

  auto_install = false,

  highlight = { enable = true },
  rainbow = { enable = true },
  indent = { enable = true, disable = { 'python' } },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<M-space>',
    },
  },
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
      set_jumps = true,
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

-- Activar y desactivar el resaltado de sintaxis
vim.keymap.set('n', '<leader>th', function()
  vim.cmd('TSBufToggle highlight')
end, { desc = '[T]oggle treesitter [H]ighlight' })

-- Activar y desactivar ts-rainbow
vim.keymap.set('n', '<leader>tr', function()
  vim.cmd('TSBufToggle rainbow')
end, { desc = '[T]oggle treesitter [R]ainbow' })

-- Atajos de teclados de diagnóstico
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set('n', '<leader>E', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Configuraciones de LSP
local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Atajos menos usados de LSP
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Crear un comando y atajo para formatear el archivo con LSP
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
  nmap('<leader>f', function()
    vim.cmd('Format')
  end, '[F]ormat file')
end

-- Activar los LSP de estos lenguajes
local servers = {
  clangd = {},
  gopls = {},
  pyright = {},
  rust_analyzer = {},
  tsserver = {},
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- Habilitar configuración de lua para neovim
require('neodev').setup()

-- Informarle a los servidores las capacidades adicionales que incluye nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Habilitar mason para que controle LSP, Debuggers, etc
require('mason').setup()

-- Asegurar que los lenguajes de arriba se instalan
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}

-- Configurar nvim-cmp
local cmp = require 'cmp'
local luasnip = require 'luasnip'

luasnip.config.setup {}

-- Agregar paréntesis al autocompletar funciones o similares
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
  mapping = cmp.mapping.preset.insert {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete {},
        ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
        ['<Tab>'] = cmp.mapping(function(fallback)
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}
