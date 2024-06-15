require("core.keymaps")
require("core.plugins")
require("core.plugin_config")

-- Automatically clear search highlights after searching
vim.api.nvim_exec([[
  augroup ClearSearchHL
    autocmd!
    autocmd CmdlineEnter / :set hlsearch
    autocmd CmdlineLeave / :set nohlsearch
  augroup END
]], false)

