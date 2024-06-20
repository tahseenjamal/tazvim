-- Setup null-ls
local null_ls = require('null-ls')
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettier.with({
            extra_args = { "--single-quote", "--jsx-single-quote" }
        }),
        -- null_ls.builtins.diagnostics.revive,  -- Use revive instead of golint
        null_ls.builtins.code_actions.gomodifytags,
        null_ls.builtins.code_actions.impl,
        null_ls.builtins.formatting.goimports_reviser,
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.golines,
    },
})

-- Simplified autoformat on save
vim.cmd([[
  augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx,*.json,*.html,*.css,*.md,*.go,*.py lua vim.lsp.buf.format { async = true }
  augroup END
]])

