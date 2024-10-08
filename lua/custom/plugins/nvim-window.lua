return {
	"yorickpeterse/nvim-window",
	event = "VeryLazy",
	config = function()
		require("nvim-window").setup({
			-- The characters available for hinting windows.
			chars = {
				"a",
				"b",
				"c",
				"d",
				"e",
				"f",
				"g",
				"h",
				"i",
				"j",
				"k",
				"l",
				"m",
				"n",
				"o",
				"p",
				"q",
				"r",
				"s",
				"t",
				"u",
				"v",
				"w",
				"x",
				"y",
				"z",
			},

			-- normal_hl = "Normal",

			-- hint_hl = 'Bold',

			border = "single",

			-- - "float" (default): renders the hints using floating windows
			-- - "status": renders the hints to a string and calls `redrawstatus`,
			--   allowing you to show the hints in a status or winbar line
			render = "float",
		})
	end,
}
