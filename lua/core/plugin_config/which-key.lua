local wk = require('which-key')

wk.setup {
    triggers = {},
    -- plugins = {
    --     marks = true, -- shows a list of your marks on ' and `
    --     registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    --     spelling = {
    --         enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
    --         suggestions = 20, -- how many suggestions should be shown in the list?
    --     },
    -- },
    -- icons = {
    --     breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    --     separator = "➜", -- symbol used between a key and it's label
    --     group = "+", -- symbol prepended to a group
    -- },
    -- layout = {
    --     height = { min = 4, max = 25 }, -- min and max height of the columns
    --     width = { min = 20, max = 50 }, -- min and max width of the columns
    --     spacing = 3, -- spacing between columns
    --     align = "left", -- align columns left, center or right
    -- },
    --
    -- show_help = true, -- show help message on the command line when the popup is visible
    -- disable = {
    --     buftypes = {},
    --     filetypes = { "TelescopePrompt" },
    -- },
}

local mappings = {
    ["<leader>rn"] = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename Symbol" },
    ["K"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover Documentation" },
    ["g"] = {
        name = "Go",
        ["d"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to Definition" },
        ["i"] = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Go to Implementation" },
    },
    ["gk"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
}

wk.register(mappings, { noremap=true, silent=true })
