return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "folke/neodev.nvim", opts = {} },
    },
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
        },
        severity_sort = true,
      },
      inlay_hints = {
        enabled = false,
      },
      capabilities = {},
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },
      -- LSP Server Settings
      servers = {
        lua_ls = {
          -- mason = false, -- set to false if you don't want this server to be installed with mason
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },
      },
      setup = {},
    },
    config = function(_, opts)
      -- Load custom handlers
      local handlers = require("plugins.lsp.handlers")

      -- Setup handlers
      handlers.setup()

      -- Load servers
      local servers = {
        "plugins.lsp.servers.python",
        "plugins.lsp.servers.clangd",
        "plugins.lsp.servers.nix",
        "plugins.lsp.servers.markdown",
      }

      for _, server in ipairs(servers) do
        require(server).setup(handlers.on_attach, handlers.capabilities)
      end
    end,
  },
}
