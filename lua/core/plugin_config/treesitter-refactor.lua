-- init.lua
require'nvim-treesitter.configs'.setup {
  refactor = {
    highlight_definitions = {
      enable = true,
      -- Set to false if you have an `updatetime` of ~100.
      clear_on_cursor_move = true,
    },
    highlight_current_scope = { enable = false },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "<leader>rn", -- set the keymap for smart rename
      },
    },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "gnd", -- set the keymap for going to definition
        list_definitions = "gnD",
        list_definitions_toc = "gO",
        goto_next_usage = "<a-*>",
        goto_previous_usage = "<a-#>",
      },
    },
  },
}




