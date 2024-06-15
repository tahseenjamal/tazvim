-- Minimal config
require("themery").setup({
     themes = {
        'gruvbox',
        'nord',
        'tokyonight',
        'onedark',
        'dracula',
        'solarized',
        'PaperColor',
        'night-owl',
        'OceanicNext',
        'everforest',
        'gruvbox-material',
        'nightfox',
        'material',
        'gruvbox8',
        'edge'
    },
  themeConfigFile = "~/.config/nvim/lua/settings/theme.lua", -- Described below
  livePreview = true, -- Apply theme while browsing. Default to true.
})


vim.api.nvim_set_keymap('n', '<leader>th', ':Themery<CR>', { noremap = true, silent = true })

