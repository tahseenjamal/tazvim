-- Setup null-ls
local null_ls = require('null-ls')

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier.with({
      extra_args = { "--single-quote", "--jsx-single-quote" }
    }),
    -- null_ls.builtins.formatting.gofmt,
  },
})

-- Simplified autoformat on save
vim.cmd([[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx,*.json,*.html,*.css,*.md,*.go,*.py lua vim.lsp.buf.format { async = true }
  augroup END
]])
