return {
	"dhruvasagar/vim-table-mode",
	init = function()
		-- 🟢 Auto-enable TableMode only in specific filetypes
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "markdown", "text", "rst" },
			callback = function()
				vim.cmd("TableModeEnable")
			end,
		})

		-- 🟢 Enable plugin globally for all files
		vim.g.table_mode_disable_mappings = 0 -- Optional: keep mappings global
		vim.keymap.set("n", "<leader>tm", ":TableModeToggle<CR>", { desc = "Toggle Table Mode" })
	end,
	lazy = false, -- 🔥 ensures plugin is loaded for all filetypes
}
