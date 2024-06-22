
require("bufferline").setup{

    options = {
        numbers = "ordinal",
        modified_icon = '●',
        close_icon = '',
        max_name_length = 18,
        max_prefix_length = 15, 
        show_buffer_icons = true, 
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        separator_style = "slant",
        sort_by = 'id',
    },
    highlights = {
        buffer_selected = {
            -- fg = '#FFFFFF', -- White color for text
            fg = '#FF0000', -- Red background color
            gui = 'bold,underline', -- Bold and underlined
        },
        numbers_selected = {
            -- fg = '#FFFFFF', -- White color for text
            fg = '#FF0000', -- Red background color
            gui = 'bold,underline', -- Bold and underlined
        },
        buffer_visible = {
            fg = '#FF0000', -- Red background color
            gui = 'bold,underline', -- Bold and underlined
        },
        close_button_selected = {
            fg = '#FF0000', -- Red background color
            gui = 'bold,underline', -- Bold and underlined
        },
    },
}

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

