require'nvim-treesitter.configs'.setup {
  ensure_installed = { "go", "python", "html" },
  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    disable = { },
    additional_vim_regex_highlighting = false,
  },

  refactor = {
    highlight_definitions = {
      enable = true,
      -- Set to false if you have an `updatetime` of ~100.
      clear_on_cursor_move = true,
    },
    highlight_current_scope = { enable = false},
    smart_rename = {
      enable = false,
      -- Assign keymaps to false to disable them, e.g. `smart_rename = false`.
      -- keymaps = {
      --   smart_rename = "<leader>rn",
      -- },
    },
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },

  indent = {
    enable = true
  },

}


