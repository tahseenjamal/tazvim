-- Setup LSP servers
local lspconfig = require'lspconfig'


-- Setup Mason
require('mason').setup()

-- Setup Mason LSPConfig
require('mason-lspconfig').setup({
    automatic_installation = true -- Automatically install configured servers
})

-- Automatically setup servers using mason-lspconfig
require('mason-lspconfig').setup_handlers({
    function(server_name)
        lspconfig[server_name].setup {}
    end,
})

-- Example LSP server setup
local servers = { "gopls", "pyright", "basedpyright","clangd", "rust_analyzer" }
for _, server in ipairs(servers) do
    lspconfig[server].setup {}
end

lspconfig.basedpyright.setup({
    settings = {
        basedpyright = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
                useLibraryCodeForTypes = true
            }
        },
        python = {
            analysis = {
                typeCheckingMode = "strict", -- Set type checking mode to strict
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
            },
        },
    },
    on_attach = function(client, bufnr)
        -- Key mappings and other on_attach configuration
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mappings.
        local opts = { noremap=true, silent=true }

    end,
})

lspconfig.pyright.setup({
    on_attach = function(client, bufnr)
        if vim.bo[bufnr].filetype == "python" then
            local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
            local opts = { noremap=true, silent=true }

            buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
            buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
            buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
            buf_set_keymap('n', 'gk', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
            buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

            -- Enable auto-format on save
            if client.server_capabilities.documentFormattingProvider then
                vim.cmd [[augroup Format]]
                vim.cmd [[autocmd! * <buffer>]]
                vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)]]
                vim.cmd [[augroup END]]
            end
        end
    end,
    flags = {
        debounce_text_changes = 150,
    },
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
                typeCheckingMode = "basic",
                stubPath = "/home/username/.local/share/nvim/stub"
            }
        }
    }
})




lspconfig.clangd.setup({
    on_attach = function(client, bufnr)
        if vim.bo[bufnr].filetype == "c" or vim.bo[bufnr].filetype == "cpp" then
            local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
            local opts = { noremap=true, silent=true }

            buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
            buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
            buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
            buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
            buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

            -- Enable auto format on save
            if client.server_capabilities.documentFormattingProvider then
                vim.api.nvim_create_autocmd("BufWritePre", {
                    buffer = bufnr,
                    callback = function()
                         -- Save the current cursor position
  local current_pos = vim.api.nvim_win_get_cursor(0)
  -- Format the entire file
  vim.api.nvim_command('normal! gg=G')
  -- Restore the cursor position
  vim.api.nvim_win_set_cursor(0, current_pos)
                    end
                })
            end
        end
    end,
    flags = {
        debounce_text_changes = 150,
    },
    cmd = { "clangd", "--compile-commands-dir=", "--fallback-style=none" },
    settings = {
        clangd = {
            filetypes = { "c", "cpp" },
            usePlaceholders = true,
            completeUnimported = true,
            semanticHighlighting = true,
            InlayHints = {
                Designators = true,
                Enabled = true,
                ParameterNames = true,
                DeducedTypes = true,
            },
            fallbackFlags = {
                "-std=c11",
                "-std=c++17",
                "-std=c++20",
            }
        }
    }
})





lspconfig.gopls.setup({
    on_attach = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local opts = { noremap=true, silent=true }

        buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

        -- Enable auto-format on save
        if client.server_capabilities.documentFormattingProvider then
            vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = bufnr,
                callback = function() vim.lsp.buf.format({ async = false }) end,
            })
        end
    end,
    flags = {
        debounce_text_changes = 150,
    },
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
                shadow = true,
            },
            staticcheck = true,
            buildFlags = { "-tags=integration" },
            codelenses = {
                generate = true,
                gc_details = true,
                tidy = true,
                upgrade_dependency = true,
                vendor = true,
                test = true,
                regenerate_cgo = true,
                run = true,
                testfunc = true,
                testfile = true,
                testpackage = true,
            },
            usePlaceholders = true,
            hints = {
                rangeVariableTypes = true,
                parameterNames = true,
                constantValues = true,
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                functionTypeParameters = true,
            },
        },
    },
})





-- Rust (rust-analyzer) setup
lspconfig.rust_analyzer.setup({
    on_attach = function(client, bufnr)
        if vim.bo[bufnr].filetype == "rust" then

            local function buf_set_keymap(...) 
                vim.api.nvim_buf_set_keymap(bufnr, ...) 
            end

            local opts = { noremap=true, silent=true }

            buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
            buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
            buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
            buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
            buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

        end
    end,
    flags = {
        debounce_text_changes = 150,
    },
    settings = {
        ["rust-analyzer"] = {
            offsetEncoding = "utf-16",
            cargo = {
                allFeatures = true,
                autoReload = true,
                loadOutDirsFromCheck = true
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
                postfix = true,
                autoimport = true,
            },
            inlayHints = {
                bindingModeHints = {
                    enable = false,
                },
                chainingHints = {
                    enable = true,
                },
                closingBraceHints = {
                    enable = true,
                    minLines = 25,
                },
                closureReturnTypeHints = {
                    enable = "never",
                },
                lifetimeElisionHints = {
                    enable = true,
                    useParameterNames = true,
                },
                maxLength = 25,
                parameterHints = {
                    enable = true,
                },
                reborrowHints = {
                    enable = "never",
                },
                renderColons = true,
                typeHints = {
                    enable = true}
                ,
                hideClosureInitialization = {
                    enable = false},
                hideNamedConstructor = {
                    enable = false
                },
            },
            imports = {
                granularity = {
                    group = "module"
                },
                prefix = "self"
            },
            assist = {
                importGranularity = "item",
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
})

