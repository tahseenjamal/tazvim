
-- Minimal config
require("themery").setup({
    themes = {
        'gruvbox',
        'nord',
        'tokyonight-night',
        'onedark',
        'kanagawa-wave',
        'kanagawa-dragon',
        'kanagawa-lotus',
        'iceberg',
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

