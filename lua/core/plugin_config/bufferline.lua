require("bufferline").setup{}

-- Creating the SplitAllBuffers command
vim.api.nvim_create_user_command('SplitAllBuffers', function()
  local current_buf = vim.api.nvim_get_current_buf()
  local buffers = vim.api.nvim_list_bufs()
  for _, buf in ipairs(buffers) do
    if buf ~= current_buf and vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_name(buf) ~= "" then
      vim.cmd('vsplit | b ' .. buf)
    end
  end
end, {})

-- Adding a key mapping for <leader>bs
vim.api.nvim_set_keymap('n', '<leader>bs', ':SplitAllBuffers<CR>', { noremap = true, silent = true })

