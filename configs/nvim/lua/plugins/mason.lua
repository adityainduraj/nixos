return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "shellcheck",  -- Shell script linter
        "shfmt",      -- Shell formatter
        "flake8",     -- Python linter
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      automatic_installation = false,  -- Disable automatic installation
      handlers = {
        -- Explicitly tell mason-lspconfig to skip installing these
        clangd = function() return true end,
        stylua = function() return true end,
      },
    },
  },
}
