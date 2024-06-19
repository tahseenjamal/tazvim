require('noice').setup({
  cmdline = {
    view = 'cmdline_popup', -- use the cmdline_popup view
    format = {
      cmdline = {
        pattern = "^:", -- Match the command line start pattern
        icon = "->", -- This acts as a heading or icon
        lang = "vim"
      },
    },
    position = {
      row = '50%', -- place in the middle
      col = '50%',
    },
    size = {
      width = '50%', -- adjust the width as needed
      height = 'auto', -- auto-adjust the height
    },
  },
  views = {
    cmdline_popup = {
      border = {
        style = "rounded", -- single line border style
        text = {
          top = " Command Prompt ", -- heading text
          top_align = "center"
        },
      },
      position = {
        row = '50%', -- place in the middle
        col = '50%',
      },
      size = {
        width = '50%',
        height = 'auto',
      },
      win_options = {
        winblend = 0, -- This makes the background fully transparent
        winhighlight = "NormalFloat:Normal,FloatBorder:Normal", -- Apply highlight group to integrate with current theme
      },
    },
  },
  routes = {
    {
      filter = { event = "cmdline" },
      view = "cmdline_popup"
    }
  },
})

-- Optional: Configure `nvim-notify` if you want to use it
require('notify').setup({
  background_colour = "#000000",
})

-- Setup the notification as a UI for Neovim
vim.notify = require('notify')

