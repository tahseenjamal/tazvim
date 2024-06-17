-- Setup LSP servers
local lspconfig = require'lspconfig'

-- Go
lspconfig.gopls.setup{
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
            usePlaceholders = true,
            completeUnimported = true,
            analyses = {
                unusedparams = true,
            },
        },
    },
    on_attach = function(client, bufnr)
        local function buf_set_option(...)
            vim.api.nvim_buf_set_option(bufnr, ...)
        end

        -- Enable completion triggered by <c-x><c-o>
        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Enable auto-format and auto-import on save
        if client.server_capabilities.documentFormattingProvider then
            vim.cmd [[augroup Format]]
            vim.cmd [[autocmd! * <buffer>]]
            vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
            vim.cmd [[autocmd BufWritePre <buffer> silent! lua vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })]]
            vim.cmd [[augroup END]]
        end

        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local opts = { noremap=true, silent=true }

        -- Various key mappings for LSP fetures
        buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        buf_set_keymap('n', '<leader>jt', '<cmd>GoTagAdd json<CR>', opts)
        buf_set_keymap('n', '<leader>yt', '<cmd>GoTagAdd yaml<CR>', opts)

    end,
}

-- Python
lspconfig.pyright.setup{
    settings = {
        python = {
            analysis = {
                autoImportCompletions = true,
            },
        },
    },

    -- Enable various python lsp features
    on_attach = function(client, bufnr)
      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
      local opts = { noremap=true, silent=true }

      -- Key mappings for LSP
      buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
      buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
      buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
      buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
      buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    end
}

-- C/C++
lspconfig.clangd.setup {
    on_attach = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local opts = { noremap=true, silent=true }

        buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
        buf_set_keymap('n', '<leader>cf', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', opts)

        -- Setup auto import on save
        if client.server_capabilities.documentFormattingProvider then
            vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
    cmd = { "clangd", "--background-index", "--suggest-missing-includes" },
    init_options = {
        clangdFileStatus = true,
        usePlaceholders = true,
        completeUnimported = true,
        semanticHighlighting = true
    },
    flags = {
        debounce_text_changes = 150,
    }
}


-- Rust (rust-analyzer) setup
lspconfig.rust_analyzer.setup {
    on_attach = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local opts = { noremap=true, silent=true }

        buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    end,
    flags = {
        debounce_text_changes = 150,
    },
    settings = {
      ["rust-analyzer"] = {
        cargo = {
            allFeatures = true
        },
        procMacro = {
            enable = true
        },
        checkOnSave = {
            command = "clippy"
        },
        diagnostics = {
            enable = true,
            disabled = { "unresolved-proc-macro" },
            enableExperimental = true
        },
        completion = {
            postfix = {
                enable = true
            },
            autoimport = {
                enable = true
            }
        },
        inlayHints = {
            typeHints = {
                enable = true
            },
            chainingHints = {
                enable = true
            },
            parameterHints = {
                enable = true
            },
            closureReturnTypeHints = {
                enable = true
            }
        },
        imports = {
            granularity = {
                group = "module"
            },
            prefix = "self"
        },
        assist = {
            importMergeBehavior = "last",
            importPrefix = "by_self"
        },
        lens = {
            enable = true,
            references = {
                enable = true
            },
            methodReferences = {
                enable = true
            },
            enumVariantReferences = {
                enable = true
            }
        },
        rustfmt = {
            enableRangeFormatting = true,
            overrideCommand = {
                "rustup", "run", "stable", "rustfmt", "--edition", "2021"
            }
        },
        hoverActions = {
            references = true,
            implementation = true
        }
    }
    }
}
