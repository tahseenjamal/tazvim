local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
local nvim_appname = vim.fn.getenv("NVIM_APPNAME")
local nvim_folder = nvim_appname and nvim_appname or "nvim"

-- Set the header with the provided ASCII art for TazVim, centered
dashboard.section.header.val = {
	[[                                                                        ]],
	[[                                                                        ]],
	[[                                                                        ]],
	[[           ████████╗ █████╗ ███████╗██╗   ██╗██╗███╗   ███╗             ]],
	[[           ╚══██╔══╝██╔══██╗╚══███╔╝██║   ██║██║████╗ ████║             ]],
	[[              ██║   ███████║  ███╔╝ ██║   ██║██║██╔████╔██║             ]],
	[[              ██║   ██╔══██║ ███╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║             ]],
	[[              ██║   ██║  ██║███████╗ ╚████╔╝ ██║██║ ╚═╝ ██║             ]],
	[[              ╚═╝   ╚═╝  ╚═╝╚══════╝  ╚═══╝  ╚═╝╚═╝     ╚═╝             ]],
	[[		https://github.com/tahseenjamal/tazvim			  ]],
}

-- Center align the buttons with spaces
dashboard.section.buttons.val = {
	dashboard.button(" n ", "    New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button(" f ", "    Find file", ":Telescope find_files<CR>"),
	dashboard.button(" r ", "    Recents", ":Telescope oldfiles<CR>"),
	dashboard.button(" s ", "    Settings", ":Telescope find_files cwd=~/.config/" .. nvim_folder .. "<CR>"),
	dashboard.button(" t ", "    Themes", ":Themery<CR>"),
	dashboard.button(" q ", "    Quit", ":qa<CR>"),
}

-- Set footer
dashboard.section.footer.val = "Welcome to TazVim, a simple neovim distro"

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Function to set cursor visibility
local function set_cursor_visibility(visible)
	if visible then
		vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr-o:hor20"
	else
		vim.opt.guicursor = "a:hor20"
	end
end

-- Autocmd to hide cursor on AlphaReady
vim.api.nvim_create_autocmd("User", {
	pattern = "AlphaReady",
	callback = function()
		set_cursor_visibility(false)
	end,
})

-- Autocmd to show cursor on BufLeave
vim.api.nvim_create_autocmd("BufLeave", {
	pattern = "*",
	callback = function()
		if vim.bo.filetype == "alpha" then
			set_cursor_visibility(true)
		end
	end,
})

-- Autocmd to show cursor on BufEnter
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	callback = function()
		if vim.bo.filetype == "alpha" then
			set_cursor_visibility(false)
		else
			set_cursor_visibility(true)
		end
	end,
})
