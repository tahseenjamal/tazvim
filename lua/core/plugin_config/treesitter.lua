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
    highlight_current_scope = { enable = true },
    smart_rename = {
      enable = false,
      -- Assign keymaps to false to disable them, e.g. `smart_rename = false`.
      -- keymaps = {
      --   smart_rename = "<leader>rn",
      -- },
    },
    navigation = {
      enable = false,
      -- Assign keymaps to false to disable them, e.g. `goto_definition = false`.
      -- keymaps = {
      --   goto_definition = "gnd",
      --   list_definitions = "gnD",
      --   list_definitions_toc = "gO",
      --   goto_next_usage = "<a-*>",
      --   goto_previous_usage = "<a-#>",
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

  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },
  },
}


