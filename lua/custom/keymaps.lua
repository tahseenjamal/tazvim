local opts = { noremap = true, silent = true }

-- Themery
vim.keymap.set("n", "<leader>th", ":Themery <CR>", opts)

-- Choose window using alphabets
vim.keymap.set("n", "<leader>w", ":lua require('nvim-window').pick()<CR>", opts)

-- Move to the next buffer using Tab
vim.api.nvim_set_keymap("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
-- Move to the previous buffer using Shift-Tab
vim.api.nvim_set_keymap("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<C-`>", [[:lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>]], opts)

function ToggleWindowState()
	if vim.g.toggle_window_state == nil or vim.g.toggle_window_state == 0 then
		vim.cmd("WindowsMaximizeHorizontally")
		vim.g.toggle_window_state = 1
	else
		vim.cmd("WindowsEqualize")
		vim.g.toggle_window_state = 0
	end
end

vim.api.nvim_set_keymap("n", "<leader>m", ":lua ToggleWindowState()<CR>", opts)

function BdeleteOther()
	local current_buf = vim.fn.bufnr("%") -- Get current buffer number
	for buf = 1, vim.fn.bufnr("$") do
		if buf ~= current_buf and vim.fn.buflisted(buf) == 1 then
			vim.cmd("Bdelete " .. buf) -- Delete other buffers
		end
	end
end

vim.api.nvim_set_keymap("n", "<leader>bo", ":lua BdeleteOther()<CR>", opts)

-- Creating the SplitAllBuffers command
vim.api.nvim_create_user_command("SplitAllBuffers", function()
	local current_buf = vim.api.nvim_get_current_buf()
	local buffers = vim.api.nvim_list_bufs()
	for _, buf in ipairs(buffers) do
		if buf ~= current_buf and vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_name(buf) ~= "" then
			vim.cmd("vsplit | b " .. buf)
		end
	end
end, {})

-- Adding a key mapping to split all buffers into window
vim.api.nvim_set_keymap("n", "<leader>bs", ":SplitAllBuffers<CR>", opts)
-- Adding a key for toggle term
vim.api.nvim_set_keymap("n", "<leader>tt", ":ToggleTerm<CR>", opts)

-- Close Buffer
vim.keymap.set("n", "<leader>bd", ":bd!<CR>:bprevious<CR>", opts)
-- New Buffer
vim.keymap.set("n", "<leader>bn", "<cmd> enew <CR>", opts)
-- Choose buffer
vim.api.nvim_set_keymap("n", "<leader>bp", ":BufferPick<CR>", opts)

-- Go to end in insert mode - end of line, below and above
vim.api.nvim_set_keymap("i", "<C-e>", "<Esc>A", opts)
vim.api.nvim_set_keymap("i", "<C-o>", "<Esc>o", opts)
vim.api.nvim_set_keymap("i", "<C-a>", "<Esc>O", opts)

-- Tabs
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", opts) -- open new tab
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", opts) -- close current tab

-- Nvim Silicon screenshot of visually selected
vim.api.nvim_set_keymap("v", "<leader>y", ":Silicon<CR>", opts)

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<S-Left>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<S-Right>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<S-Down>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<S-Up>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
