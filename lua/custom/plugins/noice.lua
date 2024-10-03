return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {
    -- add any options here
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    'MunifTanjim/nui.nvim',
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    'rcarriga/nvim-notify',
  },

  config = function()
    require('noice').setup {
      popupmenu = {
        enabled = true,
        backend = 'nui',
      },
      cmdline = {
        view = 'cmdline_popup', -- use the cmdline_popup view
        format = {
          cmdline = {
            pattern = '^:', -- Match the command line start pattern
            icon = '->', -- This acts as a heading or icon
            lang = 'vim',
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
            style = 'rounded', -- single line border style
            text = {
              top = ' Command Prompt ', -- heading text
              top_align = 'center',
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
            winhighlight = 'NormalFloat:Normal,FloatBorder:Normal', -- Apply highlight group to integrate with current theme
          },
        },
      },
      routes = {
        {
          filter = { event = 'cmdline' },
          view = 'cmdline_popup',
        },
      },
    }
  end,
}
