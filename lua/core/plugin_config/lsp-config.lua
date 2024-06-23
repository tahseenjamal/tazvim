
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
local servers = { "gopls", "pyright", "clangd", "rust_analyzer" }
for _, server in ipairs(servers) do
  lspconfig[server].setup {}
end

-- Function to apply the "Add missing type" assist
local function add_missing_type()
  local params = vim.lsp.util.make_range_params()
  params.context = { only = { "quickfix.add_type" } }
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 500)
  for _, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
      if r.edit or type(r.command) == "table" then
        if r.edit then
          vim.lsp.util.apply_workspace_edit(r.edit, "utf-16")
        end
        if type(r.command) == "table" then
          vim.lsp.buf.execute_command(r.command)
        end
      else
        vim.lsp.buf.execute_command(r)
      end
    end
  end
end

-- Rust (rust-analyzer) setup
lspconfig.rust_analyzer.setup {
    on_attach = function(client, bufnr)
        if vim.bo[bufnr].filetype == "rust" then
            local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
            local opts = { noremap=true, silent=true }

            buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
            buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
            buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
            buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
            buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

            -- Enable auto-format on save
            if client.server_capabilities.documentFormattingProvider then
                vim.cmd [[augroup Format]]
                vim.cmd [[autocmd! * <buffer>]]
                vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
                vim.cmd [[augroup END]]
            end

            -- Bind the add_missing_type function to a key
            buf_set_keymap('n', '<leader>at', '<Cmd>lua add_missing_type()<CR>', opts)
        end
    end,
    flags = {
        debounce_text_changes = 150,
    },
    settings = {
      ["rust-analyzer"] = {
        cargo = {
            allFeatures = true,
            autoReload = true
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


