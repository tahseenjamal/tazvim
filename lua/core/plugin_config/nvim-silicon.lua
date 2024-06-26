
require('nvim-silicon').setup({
	disable_defaults = false,
	debug = false,
	font = nil,
	theme = "gruvbox-dark",
	background = nil,
	background_image = nil,
	pad_horiz = 100,
	pad_vert = 80,
	no_round_corner = false,
	no_window_controls = false,
	no_line_number = false,
	line_offset = 1,
	line_pad = 0,
	tab_width = 4,
	language = nil,
	shadow_blur_radius = 16,
	-- the offset of the shadow in x and y directions
	shadow_offset_x = 8,
	shadow_offset_y = 8,
	-- the color of the shadow (in hexcode string e.g "#100808")
	shadow_color = nil,
	-- whether to strip of superfluous leading whitespace
	gobble = true,
	-- a string to pad each line with after gobbling removed larger indents,
	num_separator = nil,
	-- here a bar glyph is used to draw a vertial line and some space
	-- num_separator = "\u{258f} ",

	-- whether to put the image onto the clipboard, may produce an error,
	-- if run on WSL2
	to_clipboard = false,
	-- a string or function returning a string that defines the title
	-- showing in the image, only works in silicon versions greater than v0.5.1
	window_title = nil,
	-- here a function is used to get the name of the current buffer
	-- window_title = function()
	--     return vim.fn.fnamemodify(
	--         vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()),
	--         ":t"
	--     )
	-- end,

	-- how to deal with the clipboard on WSL2
	-- possible values are: never, always, auto
	wslclipboard = nil,
	-- what to do with the temporary screenshot image file when using the Windows
	-- clipboard from WSL2, possible values are: keep, delete
	wslclipboardcopy = nil,
	-- the silicon command, put an absolute location here, if the
	-- command is not in your ${PATH}
	command = "silicon",
	-- a string or function that defines the path to the output image
	-- output = nil
	-- here a function is used to create a file in the current directory
	output = function()
		return "~/Downloads/" .. os.date("!%Y-%m-%dT%H-%M-%SZ") .. "_code.png"
	end,                     
})

vim.api.nvim_set_keymap('v', '<leader>y', ':Silicon<CR>', { noremap = true, silent = true })

