return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	keys = {
		{ "<leader>e", ":Neotree toggle<CR>", desc = "NeoTree toggle", silent = true },
	},
	opts = {
		filesystem = {
			window = {
				border = "none",
				mappings = {
					["\\"] = "close_window",
				},
			},
		},
	},
}
