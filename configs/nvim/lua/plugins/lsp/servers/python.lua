local M = {}

function M.setup(on_attach, capabilities)
  local lspconfig = require("lspconfig")

  -- Pyright setup
  lspconfig.pyright.setup({
    cmd = { "/run/current-system/sw/bin/pyright-langserver", "--stdio" },
    on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = false
      on_attach(client, bufnr)
    end,
    capabilities = capabilities,
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = "workspace",
          useLibraryCodeForTypes = true,
          typeCheckingMode = "basic",
        },
      },
    },
  })

  -- Ruff setup
  lspconfig.ruff_lsp.setup({
    cmd = { "/run/current-system/sw/bin/ruff-lsp" },
    on_attach = function(client, bufnr)
      client.server_capabilities.hoverProvider = false
      on_attach(client, bufnr)
    end,
    capabilities = capabilities,
  })
end

return M
