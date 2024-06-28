

-- Custom keybindings for vim-move
vim.api.nvim_set_keymap('n', '<C-k>', '<Plug>MoveLineUp', {})
vim.api.nvim_set_keymap('n', '<C-j>', '<Plug>MoveLineDown', {})
vim.api.nvim_set_keymap('x', '<C-k>', '<Plug>MoveBlockUp', {})
vim.api.nvim_set_keymap('x', '<C-j>', '<Plug>MoveBlockDown', {})

