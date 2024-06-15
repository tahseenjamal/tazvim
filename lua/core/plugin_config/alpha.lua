local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')

-- Set the header with the provided ASCII art for TazVim, centered
dashboard.section.header.val = {
    [[                                                                       ]],
    [[                                                                       ]],
    [[                                                                       ]],
    [[       .___________.     ___       ________  ____    ____  __  .___  ___. ]],
    [[       |           |    /   \     |       /  \   \  /   / |  | |   \/   | ]],
    [[       `---|  |----`   /  ^  \    `---/  /    \   \/   /  |  | |  \  /  | ]],
    [[           |  |       /  /_\  \      /  /      \      /   |  | |  |\/|  | ]],
    [[           |  |      /  _____  \    /  /----.   \    /    |  | |  |  |  | ]],
    [[           |__|     /__/     \__\  /________|    \__/     |__| |__|  |__| ]],
    [[                                                                       ]],
}

-- Center align the buttons with spaces
dashboard.section.buttons.val = {
    dashboard.button(" f ", "    Find file", ":Telescope find_files<CR>"),
    dashboard.button(" r ", "    Recents", ":Telescope oldfiles<CR>"),
    dashboard.button(" s ", "    Settings", ":Telescope find_files cwd=~/.config/nvim<CR>"),
    dashboard.button(" t ", "    Themes", ":Themery<CR>"),
    dashboard.button(" q ", "    Quit", ":qa<CR>"),
}

-- Set footer
dashboard.section.footer.val = "Welcome to TazVim, a simple neovim distro"

-- Send config to alpha
alpha.setup(dashboard.opts)

