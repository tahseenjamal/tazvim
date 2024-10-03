return {
  'akinsho/toggleterm.nvim',

  config = function()
    require('toggleterm').setup {
      size = 20,
      -- open_mapping = [[<leader>tt]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = '1', -- The degree by which to darken to terminal background, default: 1
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      direction = 'float',
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = 'rounded',
        winblend = 3,
      },
    }
  end,
}
