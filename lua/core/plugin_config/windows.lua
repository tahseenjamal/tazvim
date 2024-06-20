require('windows').setup({})

local toggle_window_state = 0

function ToggleWindowState()
  if toggle_window_state == 1 then
    vim.cmd('WindowsEqualize')
    toggle_window_state = 0
  else
    vim.cmd('WindowsMaximizeHorizontally')
    toggle_window_state = 1
  end
end

vim.api.nvim_set_keymap('n', '<leader>m', ':lua ToggleWindowState()<CR>', { noremap = true, silent = true })

