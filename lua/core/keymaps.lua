
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
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true

-- vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- Function to close all buffers except the current one
function CloseOtherBuffers()
    local current_buf = vim.api.nvim_get_current_buf()
    local buffers = vim.api.nvim_list_bufs()

    for _, buf in ipairs(buffers) do
        if buf ~= current_buf and vim.api.nvim_buf_is_loaded(buf) then
            vim.cmd('bd ' .. buf)
        end
    end
end

-- Map the function to a key combination, e.g., <leader>bo (buffer other)
vim.api.nvim_set_keymap('n', '<leader>bo', ':lua CloseOtherBuffers()<CR>', { noremap = true, silent = true })


-- Key mapping to close the current buffer
vim.api.nvim_set_keymap('n', '<leader>bd', ':bd<CR>', { noremap = true, silent = true })
--
-- Key mapping to close the current unsaved buffer
vim.api.nvim_set_keymap('n', '<leader>bu', ':bd!<CR>', { noremap = true, silent = true })

-- Key mapping to close all buffers
vim.api.nvim_set_keymap('n', '<leader>ba', ':bufdo bd<CR>', { noremap = true, silent = true })

-- Key mapping to navigate between buffers
vim.api.nvim_set_keymap('n', '<leader>bf', ':bp<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bj', ':bn<CR>', { noremap = true, silent = true })


-- Code Action LSP
vim.api.nvim_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap=true, silent=true })


