local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    -- My plugins here
    
    -- Windows plugin
    use { "anuvyklack/windows.nvim",
        requires = "anuvyklack/middleclass"
    }

    -- NeoVim Tree
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = { 
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    }

    -- lspkind icons
    use 'onsails/lspkind-nvim'

    -- Bufferline
    use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}

    -- Nvim windows
    use "yorickpeterse/nvim-window"

    -- Auto pairs
    use 'windwp/nvim-autopairs'

    use 'folke/which-key.nvim'

    -- Indent lines
    use "lukas-reineke/indent-blankline.nvim"

    -- Comment plugin
    use 'numToStr/Comment.nvim'

    -- Git signs
    use 'lewis6991/gitsigns.nvim'


    -- Copilot plugins
    use "github/copilot.vim"

    -- Mason and its LSP config
    use 'williamboman/mason.nvim'

    use {
        'williamboman/mason-lspconfig.nvim',
        requires = { 'neovim/nvim-lspconfig' }
    }


    -- LSP Configurations
    use 'neovim/nvim-lspconfig'

    -- Autocompletion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    use {
        'olexsmir/gopher.nvim',
        build = function() 
            vim.cmd [[silent! GoInstallDeps]]
        end,
    }

    use {
        'williamboman/nvim-lsp-installer',
        config = function()
            require('nvim-lsp-installer').setup {
                automatic_installation = true,
            }
        end
    }

    use 'nvim-telescope/telescope-ui-select.nvim' -- Optional: for a better code action UI



    -- use 'ellisonleao/gruvbox.nvim'
    use 'nvim-tree/nvim-tree.lua'
    use 'nvim-tree/nvim-web-devicons'
    use 'nvim-lualine/lualine.nvim'
    use 'nvim-treesitter/nvim-treesitter'

    use {
        'nvim-treesitter/nvim-treesitter-refactor',
        after = 'nvim-treesitter',
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'}, {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } }
    }
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end}
    use 'sunjon/shade.nvim'
    use 'folke/flash.nvim'
    use({
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        requires = {
            "nvim-lua/plenary.nvim",
        },
    })

    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })


    use 'jose-elias-alvarez/null-ls.nvim'
    use 'ThePrimeagen/refactoring.nvim'
    use 'MunifTanjim/nui.nvim'
    use {
        'folke/noice.nvim',
        requires = { 'MunifTanjim/nui.nvim', 'rcarriga/nvim-notify' }
    }

    use {
        'goolord/alpha-nvim',
        requires = { 'nvim-lua/plenary.nvim' }
    }
    use 'yamatsum/nvim-cursorline'

    use 'zaldih/themery.nvim'
    -- Themes
    use { 'morhetz/gruvbox', config = function() vim.cmd('colorscheme gruvbox') end }
    use { 'arcticicestudio/nord-vim', config = function() vim.cmd('colorscheme nord') end }
    use { 'folke/tokyonight.nvim', config = function() vim.cmd('colorscheme tokyonight') end }
    use { 'joshdick/onedark.vim', config = function() vim.cmd('colorscheme onedark') end }
    use { 'dracula/vim', config = function() vim.cmd('colorscheme dracula') end }
    use { 'altercation/vim-colors-solarized', config = function() vim.cmd('colorscheme solarized') end }
    use { 'NLKNguyen/papercolor-theme', config = function() vim.cmd('colorscheme PaperColor') end }
    use { 'haishanh/night-owl.vim', config = function() vim.cmd('colorscheme night-owl') end }
    use { 'mhartington/oceanic-next', config = function() vim.cmd('colorscheme OceanicNext') end }
    use { 'sainnhe/everforest', config = function() vim.cmd('colorscheme everforest') end }
    use { 'sainnhe/gruvbox-material', config = function() vim.cmd('colorscheme gruvbox-material') end }
    use { 'EdenEast/nightfox.nvim', config = function() vim.cmd('colorscheme nightfox') end }
    use { 'marko-cerovac/material.nvim', config = function() vim.g.material_style = 'darker' require('material').setup() vim.cmd('colorscheme material') end }
    use { 'lifepillar/vim-gruvbox8', config = function() vim.cmd('colorscheme gruvbox8') end }
    use { 'sainnhe/edge', config = function() vim.cmd('colorscheme edge') end }
    -- End of themes


    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
