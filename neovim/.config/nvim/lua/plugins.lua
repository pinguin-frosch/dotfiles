return require('packer').startup(function(use)
    -- Packer
    use 'wbthomason/packer.nvim'

    -- Theme
    use 'olimorris/onedarkpro.nvim'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use "williamboman/nvim-lsp-installer"

    -- Completions
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'

    -- Snippets
    use 'L3MON4D3/LuaSnip'

    -- File explorer
    use 'kyazdani42/nvim-tree.lua'
    use 'kyazdani42/nvim-web-devicons'

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Autopairs
    use 'windwp/nvim-autopairs'

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Bufferline
    use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}

    -- Comment
    use 'numToStr/Comment.nvim'

    -- Neovim surround
    use 'ur4ltz/surround.nvim'

    -- Gitsigns
    use 'lewis6991/gitsigns.nvim'
end)
