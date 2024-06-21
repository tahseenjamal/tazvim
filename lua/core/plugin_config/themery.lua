
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

