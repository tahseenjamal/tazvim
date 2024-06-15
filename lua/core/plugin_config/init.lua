
require("core.plugin_config.gruvbox")
require("core.plugin_config.lualine")
require("core.plugin_config.nvim-tree")
require("core.plugin_config.telescope")
require("core.plugin_config.toggleterm")
require("core.plugin_config.treesitter")
require("core.plugin_config.flash")
require("core.plugin_config.lazygit")
require("core.plugin_config.treesitter-refactor")
require("core.plugin_config.noice")
require('core.plugin_config.alpha')
require('core.plugin_config.themery')
require('core.plugin_config.cursorline')
require('core.plugin_config.lsp-config')
require('core.plugin_config.indentline')
require('core.plugin_config.which-key')


-- Define a function to load the theme
local function load_theme()
  require("settings.theme")
end

-- Ensure the theme is loaded after Vim has loaded all plugins
vim.api.nvim_create_autocmd("VimEnter", {
  callback = load_theme,
})
