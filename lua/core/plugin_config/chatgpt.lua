
local nvim_appname = vim.fn.getenv("NVIM_APPNAME")
local base_path = vim.fn.expand("~/.config/")
local nvim_folder = nvim_appname and nvim_appname or "nvim"

require('chatgpt').setup({
    api_key = vim.fn.getenv('OPENAI_API_KEY'),  -- Fetch the API key from environment variables
    actions_paths = { base_path .. nvim_folder .. "/lua/settings/gpt_actions.json" },
    openai_params = {
        model = "gpt-4",
        temperature = 0.5, -- adjust temperature as needed
        max_tokens = 500, -- adjust max tokens as needed
    },
    popup_window = {
        border = {
            style = "rounded",
            text = {
                top = " ChatGPT ",
                top_align = "center"
            }
        },

      win_options = {
        winblend = 0, -- This makes the background fully transparent
        -- winhighlight = "NormalFloat:None,FloatBorder:FloatBorder", -- Apply highlight group to integrate with current theme
      },
    },
    log_level = "info",  -- "info" | "warn" | "error"
})

-- Key mappings for ChatGPT.nvim
local opts = { noremap = true, silent = true }

-- Map the custom key to open the ChatGPT window
vim.api.nvim_set_keymap('n', '<leader>cg', '<cmd>ChatGPT<CR>', opts)

-- ChatGPT edit with instructions
vim.api.nvim_set_keymap('v', '<leader>ce', '<cmd>ChatGPTEditWithInstructions<CR>', opts)
-- close = "<C-c>", 
-- accept = "<C-y>", 
-- toggle_diff = "<C-d>", 
-- toggle_settings = "<C-o>", 
-- toggle_help = "<C-h>", 
-- cycle_windows = "<Tab>", 
-- use_output_as_input = "<C-i>", 


vim.cmd [[
  highlight NormalFloat guifg=#000000 guibg=NONE
  highlight FloatBorder guifg=#000000 guibg=NONE
]]
