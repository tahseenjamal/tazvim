-- Setup Mason
require('mason').setup()

-- Setup Mason LSPConfig
require('mason-lspconfig').setup({
  automatic_installation = true -- Automatically install configured servers
})

-- Setup LSPConfig
local lspconfig = require('lspconfig')

-- Automatically setup servers using mason-lspconfig
require('mason-lspconfig').setup_handlers({
  function(server_name)
    lspconfig[server_name].setup {}
  end,
})

-- Example LSP server setup
local servers = { "gopls", "pyright", "tsserver" }
for _, server in ipairs(servers) do
  lspconfig[server].setup {}
end

