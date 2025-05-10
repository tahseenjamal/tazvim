require("custom.options")
require("custom.keymaps")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Set up plugins
require("lazy").setup({
	require("custom.plugins.alpha"),
	require("custom.plugins.autopairs"),
	require("custom.plugins.barbar"),
	require("custom.plugins.chatgpt"),
	require("custom.plugins.conform"),
	require("custom.plugins.crates"),
	require("custom.plugins.flash"),
	require("custom.plugins.gitsigns"),
	require("custom.plugins.gopher"),
	require("custom.plugins.hlchunk"),
	require("custom.plugins.inc-rename"),
	require("custom.plugins.lazydev"),
	require("custom.plugins.lazygit"),
	require("custom.plugins.lint"),
	require("custom.plugins.lualine"),
	require("custom.plugins.markdown"),
	require("custom.plugins.mini"),
	require("custom.plugins.neo-tree"),
	require("custom.plugins.noice"),
	require("custom.plugins.nvim-ts-autotag"),
	require("custom.plugins.nvim-cmp"),
	require("custom.plugins.nvim-lspconfig"),
	require("custom.plugins.nvim-silicon"),
	require("custom.plugins.nvim-treesitter"),
	require("custom.plugins.nvim-window"),
	-- require("custom.plugins.oil"),
	require("custom.plugins.screenkey"),
	require("custom.plugins.snacks"),
	require("custom.plugins.table-mode"),
	require("custom.plugins.telescope"),
	require("custom.plugins.themery"),
	require("custom.plugins.themes"),
	require("custom.plugins.tmux-navigator"),
	require("custom.plugins.todo-comments"),
	require("custom.plugins.toggleterm"),
	require("custom.plugins.vim-bbye"),
	require("custom.plugins.vim-sleuth"),
	require("custom.plugins.which-key"),
	require("custom.plugins.windows"),
	require("custom.plugins.luvit-meta"),
	require("custom.plugins.undotree"),
})

require("custom.alpha")
