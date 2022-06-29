return require('packer').startup(function(use)
    -- Packer
    use 'wbthomason/packer.nvim'

    -- Theme
    use 'olimorris/onedarkpro.nvim'

    -- LSP, completions and snippets
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lua'
    use 'L3MON4D3/LuaSnip'
    use 'onsails/lspkind.nvim'

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
    use {'akinsho/bufferline.nvim', tag = 'v2.*', requires = 'kyazdani42/nvim-web-devicons'}

    -- Comment
    use 'numToStr/Comment.nvim'

    -- Gitsigns
    use 'lewis6991/gitsigns.nvim'
end)
