local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fs', function() builtin.find_files({ cwd = "~/.config/nvim" }) end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { noremap = true, silent = true })

local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
      n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
  },
  pickers = {
    find_files = {
      attach_mappings = function(prompt_bufnr, map)
        -- Add your custom mappings here if any
        -- Example:
        -- map('i', '<C-x>', actions.select_horizontal)
        
        -- Ensure to return true to use default mappings or false to use only attached mappings
        return true
      end,
    },
    buffers = {
      attach_mappings = function(prompt_bufnr, map)
        -- Add your custom mappings here if any
        -- Example:
        -- map('i', '<C-x>', actions.select_horizontal)
        
        -- Ensure to return true to use default mappings or false to use only attached mappings
        return true
      end,
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    },
  },
}

-- To get fzf loaded and working with telescope, you need to call
telescope.load_extension('fzf')

