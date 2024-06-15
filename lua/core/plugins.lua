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
  use 'ellisonleao/gruvbox.nvim'
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


  use 'neovim/nvim-lspconfig'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'ThePrimeagen/refactoring.nvim'
  use 'MunifTanjim/nui.nvim'
  use {
    'folke/noice.nvim',
    requires = { 'MunifTanjim/nui.nvim', 'rcarriga/nvim-notify' }
  }

  use "kylechui/nvim-surround"

  use {
  'goolord/alpha-nvim',
  requires = { 'nvim-lua/plenary.nvim' }
  }

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
