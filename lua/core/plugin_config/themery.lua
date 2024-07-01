
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
            name = "Catppuccin light",
            colorscheme = "catppuccin",
            before = [[ vim.g.catppuccin_flavour = "latte" ]],
        },
        {
            name = "Catppuccin dark",
            colorscheme = "catppuccin",
            before = [[ vim.g.catppuccin_flavour = "mocha" ]],
        },
        {
            name = "Catppuccin frappe",
            colorscheme = "catppuccin",
            before = [[ vim.g.catppuccin_flavour = "frappe" ]],
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
        'github_dark',
        'github_light',
        'github_dark_dimmed',
        'github_dark_default',
        'github_light_default',
        'github_dark_high_contrast',
        'github_light_high_contrast',
        'github_dark_colorblind',
        'github_light_colorblind',
        'github_dark_tritanopia',
        'github_light_tritanopia',
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

