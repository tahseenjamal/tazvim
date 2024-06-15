-- Define custom highlight groups
vim.cmd [[
  highlight FlashChar1 guifg=#FF0000 gui=bold
  highlight FlashChar2 guifg=#00FF00 gui=bold
  highlight FlashChar3 guifg=#0000FF gui=bold
]]

-- Apply custom highlight groups to flash.nvim
require('packer').startup(function()
  use {
    'folke/flash.nvim',
    event = "VeryLazy",
    config = function()
      -- Setup and keybindings configuration here
      require("flash").setup({
        label = {
          before = 'FlashChar1',
          after = 'FlashChar2',
        },
        search = {
          matches = 'FlashChar3',
        },
      })
    end
  }
end)

-- Keybindings for flash.nvim
vim.keymap.set('n', '<C-s>', function() require("flash").jump() end, { noremap = true, silent = true, desc = "Flash Jump" })
vim.keymap.set('n', '<C-S-s>', function() require("flash").treesitter() end, { noremap = true, silent = true, desc = "Flash Treesitter" })
vim.keymap.set('o', '<C-r>', function() require("flash").remote() end, { noremap = true, silent = true, desc = "Remote Flash" })
vim.keymap.set('o', '<C-S-r>', function() require("flash").treesitter_search() end, { noremap = true, silent = true, desc = "Treesitter Search" })
vim.keymap.set('c', '<C-s>', function() require("flash").toggle() end, { noremap = true, silent = true, desc = "Toggle Flash Search" })
