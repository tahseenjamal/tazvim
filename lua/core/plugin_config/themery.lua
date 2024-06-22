
-- Minimal config
require("themery").setup({
    themes = {
        {
            name = "Gruvbox dark",
            colorscheme = "gruvbox",
            before = [[ vim.opt.background = "dark" ]],
        },
        {
            name = "Gruvbox light",
            colorscheme = "gruvbox",
            before = [[ vim.opt.background = "light" ]],
            after = [[]]
        },
        {
            name = "Catppuccino light",
            colorscheme = "catppuccin",
            before = [[ vim.opt.background = "light" ]],
        },
        {
            name = "Catppuccino dark",
            colorscheme = "catppuccin",
            before = [[ vim.opt.background = "dark" ]],
        },
        {
            name = "Neosolarized light",
            colorscheme = "NeoSolarized",
            before = [[ vim.opt.background = "light" ]],
        },
        {
            name = "Neosolarize dark",
            colorscheme = "NeoSolarized",
            before = [[ vim.opt.background = "dark" ]],
        },
        {
            name = "Adwaita dark",
            colorscheme = "adwaita",
            before = [[ vim.opt.background = "dark" ]],
        },
        {
            name = "Adwaita light",
            colorscheme = "adwaita",
            before = [[ vim.opt.background = "light" ]],
        },
        'sacredforest',
        'nord',
        'tokyonight-day',
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
        'edge',
        'sonokai',
        'moonlight',
        {
            name = "Caret dark",
            colorscheme = "caret",
            before = [[ vim.opt.background = "dark" ]],
        },
        {
            name = "Caret light",
            colorscheme = "caret",
            before = [[ vim.opt.background = "light" ]],
            after = [[]]
        },
    },
    themeConfigFile = "~/.config/nvim/lua/settings/theme.lua", -- Described below
    livePreview = true, -- Apply theme while browsing. Default to true.
})



vim.api.nvim_set_keymap('n', '<leader>th', ':Themery<CR>', { noremap = true, silent = true })

