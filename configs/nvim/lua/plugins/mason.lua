return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      automatic_installation = false,
      handlers = {
        clangd = function() return true end,  -- Skip clangd installation
        stylua = function() return true end,
      },
    },
  },
}
