
-- Hide tild (~) on the end of the buffers
vim.opt.fillchars = { eob = ' ' }


-- Enable absolute line numbers
vim.wo.number = true
-- Enable relative line numbers
vim.wo.relativenumber = true

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true
vim.opt.hlsearch = false
vim.opt.incsearch = true


vim.opt.tabstop = 4
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')



-- Key mapping to close the current buffer
vim.api.nvim_set_keymap('n', '<leader>bd', ':bd<CR>', { noremap = true, silent = true })
-- Key mapping to close all buffers
vim.api.nvim_set_keymap('n', '<leader>ba', ':bufdo bd<CR>', { noremap = true, silent = true })

-- Key mapping to navigate between buffers
vim.api.nvim_set_keymap('n', '<leader>bb', ':bp<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bn', ':bn<CR>', { noremap = true, silent = true })


-- Code Action LSP
vim.api.nvim_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap=true, silent=true })


