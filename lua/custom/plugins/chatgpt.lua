return {
	"jackMort/ChatGPT.nvim",
	config = function()
		require("chatgpt").setup({
			openai_params = {
				model = "gpt-4o", -- Specify the model here, such as "gpt-4" or "gpt-3.5-turbo"
			},
		})
	end,
	requires = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
}
