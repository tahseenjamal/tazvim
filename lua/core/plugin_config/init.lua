
-- require("core.plugin_config.gruvbox")
require("core.plugin_config.lualine")
require("core.plugin_config.nvim-tree")
require("core.plugin_config.telescope")
require("core.plugin_config.toggleterm")
require("core.plugin_config.treesitter")
require("core.plugin_config.flash")
require("core.plugin_config.lazygit")
require("core.plugin_config.noice")
require('core.plugin_config.alpha')
require('core.plugin_config.themery')
require('core.plugin_config.cursorline')
require('core.plugin_config.lsp-config')
require('core.plugin_config.nvim-cmp')
require('core.plugin_config.null-ls')
require('core.plugin_config.gopher')
require('core.plugin_config.indentline')
require('core.plugin_config.which-key')
require('core.plugin_config.comment')
require('core.plugin_config.autopairs')
require('core.plugin_config.gitsigns')
require('core.plugin_config.neotree')
require('core.plugin_config.bufferline')




-- Ensure the theme and cursorline are set correctly after all plugins are loaded
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
  vim.opt.cursorline = true
  end,
})

vim.defer_fn(function()
    require("settings.theme")
end, 1)


