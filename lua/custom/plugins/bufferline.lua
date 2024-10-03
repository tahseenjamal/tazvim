return {
  'akinsho/bufferline.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', enabled = true }, -- optional, for file icons

  config = function()
    -- Get the background and foreground colors from the 'Normal' highlight group
    local function get_color(group, attribute)
      return vim.api.nvim_get_hl_by_name(group, true)[attribute] and string.format('#%06x', vim.api.nvim_get_hl_by_name(group, true)[attribute]) or nil
    end
    require('bufferline').setup {
      highlights = {
        fill = {
          guibg = get_color('Normal', 'background'),
        },
        buffer_selected = {
          guifg = get_color('Normal', 'foreground'),
          guibg = get_color('Normal', 'background'),
        },
        background = {
          guibg = get_color('Normal', 'background'),
        },
      },
      options = {
        modified_icon = '●',
        -- close_icon = '',
        max_name_length = 18,
        max_prefix_length = 15,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        -- show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        separator_style = 'slant',
        sort_by = 'id',
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'File Explorer',
            highlight = 'Directory',
            text_align = 'left',
          },
        },
      },
    }
  end,
}
