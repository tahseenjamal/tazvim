local opts = { noremap = true, silent = true }

-- Key mapping 
vim.api.nvim_set_keymap('n', '<leader>l', ':lua require("flash").jump({search = {mode = "search", max_length = 0}, label = {after = {0, 0}}, pattern = "^"})<CR>', opts)
vim.keymap.set('n', '<C-s>', function() require("flash").jump() end, { noremap = true, silent = true, desc = "Flash Jump" })
vim.keymap.set('n', '<C-S-s>', function() require("flash").treesitter() end, { noremap = true, silent = true, desc = "Flash Treesitter" })
vim.keymap.set('o', '<C-r>', function() require("flash").remote() end, { noremap = true, silent = true, desc = "Remote Flash" })
vim.keymap.set('o', '<C-S-r>', function() require("flash").treesitter_search() end, { noremap = true, silent = true, desc = "Treesitter Search" })
vim.keymap.set('c', '<C-s>', function() require("flash").toggle() end, { noremap = true, silent = true, desc = "Toggle Flash Search" })
