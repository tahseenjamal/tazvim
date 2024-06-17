-- Setup Mason
require('mason').setup()

-- Setup Mason LSPConfig
require('mason-lspconfig').setup {
  automatic_installation = true -- Automatically install configured servers
}

-- Automatically install and setup LSP servers configured by lspconfig
require('mason-lspconfig').setup_handlers {
  function (server_name) -- default handler (optional)
    lspconfig[server_name].setup {}
  end
}


