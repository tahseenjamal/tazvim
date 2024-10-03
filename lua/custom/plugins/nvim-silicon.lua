return {
  'michaelrommel/nvim-silicon',
  config = function()
    require('nvim-silicon').setup {
      disable_defaults = false,
      debug = false,
      font = nil,
      theme = 'gruvbox-dark',
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
      shadow_offset_x = 8,
      shadow_offset_y = 8,
      shadow_color = nil,
      gobble = true,
      num_separator = nil,
      to_clipboard = false,
      window_title = nil,
      wslclipboard = nil,
      wslclipboardcopy = nil,
      command = 'silicon',
      output = function()
        return '~/Downloads/' .. os.date '!%Y-%m-%dT%H-%M-%SZ' .. '_code.png'
      end,
    }
  end,
}
