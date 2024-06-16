require('toggleterm').setup({
  size = 20,
  open_mapping = [[<c-\>]],
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
    border = 'curved',
    winblend = 3,
  },
  on_open = function(term)
      vim.cmd("set lazyredraw")
  end,
  on_close = function(term)
      vim.cmd("set nolazyredraw")
  end,
})




-- Keybindings for toggleterm
vim.api.nvim_set_keymap('n', '<leader>ft', '<Cmd>ToggleTerm direction=float<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<leader>ft', '<Cmd>ToggleTerm<CR>', { noremap = true, silent = true })
