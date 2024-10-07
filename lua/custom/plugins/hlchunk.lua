return {
	"shellRaining/hlchunk.nvim",
	config = function()
		require("hlchunk").setup({
			chunk = {
				enable = true,
				disable_animation = true,
				duration = 0,
				delay = 0,
			},
			indent = {
				enable = true,
			},
			line_num = {
				enable = true,
			},
		})
	end,
}
