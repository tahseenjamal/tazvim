-- Get the NVIM_APPNAME environment variable
local nvim_appname = vim.fn.getenv("NVIM_APPNAME")

-- Set the base path
local base_path = "~/.config/"

-- If NVIM_APPNAME is set, use it; otherwise default to 'nvim'
local nvim_folder = nvim_appname and nvim_appname or "nvim"

-- Construct the full path
local theme_path = base_path .. nvim_folder .. "/lua/settings/theme.lua"

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
        {
            name = "Bamboo light",
            colorscheme = "bamboo",
            before = [[ vim.opt.background = "light" ]],
        },
        {
            name = "Bamboo vulgaris",
            colorscheme = "bamboo",
            before = [[ vim.opt.background="dark" ]],
        },
        { name = 'Evergarden Dark', 
            colorscheme = 'evergarden',
            before = [[ vim.opt.background="dark" ]],
        },
        { name = 'Seoul 236', 
            colorscheme = 'seoul256',
            before = [[ vim.g.seoul256_background="236"]],
        },
        { name = 'Seoul 237', 
            colorscheme = 'seoul256',
            before = [[ vim.g.seoul256_background="237"]],
        },
        { name = 'Seoul 238', 
            colorscheme = 'seoul256',
            before = [[ vim.g.seoul256_background="238"]],
        },
        { name = 'Seoul 239', 
            colorscheme = 'seoul256',
            before = [[ vim.g.seoul256_background="239"]],
        },
        { name = 'Candid', 
            colorscheme = 'candid',
            before = [[ vim.opt.background="dark" ]],
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
    themeConfigFile = theme_path, -- Use the dynamically constructed path

    livePreview = true, -- Apply theme while browsing. Default to true.
})

vim.api.nvim_set_keymap('n', '<leader>th', ':Themery<CR>', { noremap = true, silent = true })

