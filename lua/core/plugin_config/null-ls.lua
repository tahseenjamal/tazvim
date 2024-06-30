
local null_ls = require('null-ls')

-- Create a group for LSP formatting
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- Setup null-ls
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettierd.with({
            filetypes = { "javascript", "typescript", "css", "html", "json", "yaml", "markdown", "lua" }, -- Add your supported filetypes
            extra_args = { "--single-quote", "--jsx-single-quote" }
        }),
        -- null_ls.builtins.diagnostics.revive,  -- Use revive instead of golint
        null_ls.builtins.code_actions.gomodifytags,
        null_ls.builtins.code_actions.impl,
        null_ls.builtins.formatting.goimports_reviser,
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.golines,
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function() vim.lsp.buf.format({ bufnr = bufnr, async = true }) end,
            })
        end
    end,
})


-- Simplified autoformat on save for various file types
vim.api.nvim_create_augroup("FormatAutogroup", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
    group = "FormatAutogroup",
    pattern = "*.js,*.jsx,*.ts,*.tsx,*.json,*.html,*.css,*.md,*.go,*.py,*.c,*.cpp",
    callback = function() vim.lsp.buf.format({ async = true }) end,
})
