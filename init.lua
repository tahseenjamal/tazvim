vim.opt.termguicolors = true
vim.opt.cursorline = true

vim.o.guifont = "MesloLGS NF:h14"

local nvim_appname = vim.fn.getenv("NVIM_APPNAME")
local base_path = vim.fn.expand("~/.config/")
local nvim_folder = nvim_appname and nvim_appname or "nvim"

-- Function to reload plugins.lua and run :PackerSync
function ReloadConfigAndSync()
  vim.cmd("source " .. base_path .. nvim_folder .. "/lua/core/plugins.lua")
  vim.cmd("PackerSync")
end

-- Set up an autocommand to watch for changes to plugins.lua
vim.cmd([[
  augroup PackerUserConfig
    autocmd!
    autocmd BufWritePost ]] .. base_path .. nvim_folder .. [[/lua/core/plugins.lua lua ReloadConfigAndSync()

  augroup end
]])

require("core.keymaps")
require("core.plugins")
pcall(require, "core.plugin_config")

-- Automatically clear search highlights after searching
vim.api.nvim_exec([[
  augroup ClearSearchHL
    autocmd!
    autocmd CmdlineEnter / :set hlsearch
    autocmd CmdlineLeave / :set nohlsearch
  augroup END
]], false)

-- Function to switch to buffer by position
local function switch_to_buffer_by_position(position)
    local buffers = vim.fn.getbufinfo({ buflisted = 1 })
    if position <= #buffers then
        vim.api.nvim_set_current_buf(buffers[position].bufnr)
    else
        print("Buffer " .. position .. " does not exist")
    end
end

-- Key mappings for Ctrl+1 to Ctrl+9
for i = 1, 9 do
    vim.api.nvim_set_keymap('n', '<C-' .. i .. '>', '', {
        noremap = true,
        callback = function() switch_to_buffer_by_position(i) end,
        silent = true
    })
end


-- Set the working directory to the directory of the current working directory
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.cmd("silent! lcd " .. vim.fn.expand("%:p:h"))
    end
})


-- Additional configuration for user experience
-- Enable Emmet for HTML and CSS files
vim.g.user_emmet_leader_key = '<C-Z>'

-- Auto-close HTML tags
vim.g.closetag_filenames = '*.html,*.xhtml,*.phtml'
