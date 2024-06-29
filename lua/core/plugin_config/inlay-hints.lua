local inlay_hints = require("inlay-hints")

inlay_hints.setup({
    commands = { enable = true },
    autocmd = { enable = true },
    options = {
        highlight = "Comment",
        prefix = " » ",
        aligned = false,
        only_current_line = false,
        enabled = { "TypeHint", "ChainingHint", "ParameterHint" },
    },
})

-- Define the keymap for enabling inlay hints
vim.api.nvim_set_keymap('n', '<leader>h', ':lua vim.lsp.inlay_hint.enable()<CR>', { noremap = true, silent = true })
