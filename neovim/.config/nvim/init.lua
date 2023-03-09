require('pinguinfrosch.options')
require('pinguinfrosch.keymaps')
require('pinguinfrosch.autocommands')

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

  -- Detectar tabstop y shiftwidth automáticamente
  'tpope/vim-sleuth',

  -- Muestra autocompletado para atajos pendientes
  'folke/which-key.nvim',

  -- Plugin para comentar
  'numToStr/Comment.nvim',

  -- Plugin para modificar los delimitadores
  'kylechui/nvim-surround',

  -- Autocerrar pares
  'windwp/nvim-autopairs',

  -- Tema inspirado por Atom
  {
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'onedark'
    end,
  },

  -- Plugin para buscar archivos, entre otras cosas
  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- Destacar, editar y navigar el código
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = { 'p00f/nvim-ts-rainbow' },
  },

  {
    -- Autocompletado
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip'
    },
  },

  -- Plugins de LSP
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'folke/neodev.nvim',
    },
  },

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

  -- Añade los símbolos para indicar los cambios en git
  {
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
local on_attach = function(client, bufnr)
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

  -- Formateo para json
  if client.name == 'jsonls' then
    nmap('<leader>f', function()
      vim.cmd('%!jq .')
    end, '[F]ormat file')
  end

  -- Activar el formateo de LSP
  if client.server_capabilities.documentFormattingProvider then
    nmap('<leader>f', function()
      vim.lsp.buf.format()
    end, '[F]ormat file')
  end
end

-- Activar los LSP de estos lenguajes
local servers = {
  jsonls = {
    init_options = {
      provideFormatter = false,
    },
  },
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
      init_options = servers[server_name].init_options,
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
