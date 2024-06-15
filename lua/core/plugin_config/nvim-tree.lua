-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  on_attach = function(bufnr)
    local api = require('nvim-tree.api')
    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- Default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- Custom mapping to create a file
    vim.keymap.set('n', 'a', function()
      local node = api.tree.get_node_under_cursor()
      local parent_dir = node.type == "directory" and node.absolute_path or vim.fn.fnamemodify(node.absolute_path, ":h")

      vim.ui.input({ prompt = "Create file: " }, function(input)
        if input then
          local full_path = parent_dir .. "/" .. input
          -- Create a file
          vim.fn.writefile({}, full_path)
          api.tree.reload()
        end
      end)
    end, opts('Create File'))

    -- Custom mapping to create a directory
    vim.keymap.set('n', 'A', function()
      local node = api.tree.get_node_under_cursor()
      local parent_dir = node.type == "directory" and node.absolute_path or vim.fn.fnamemodify(node.absolute_path, ":h")

      vim.ui.input({ prompt = "Create directory: " }, function(input)
        if input then
          local full_path = parent_dir .. "/" .. input
          -- Remove the trailing slash and create directory
          full_path = full_path:sub(1, -1)
          vim.fn.mkdir(full_path, "p")
          api.tree.reload()
        end
      end)
    end, opts('Create Directory'))
  end
})


vim.keymap.set('n', '<leader>e', ':NvimTreeFindFileToggle<CR>', { noremap = true, silent = true })
