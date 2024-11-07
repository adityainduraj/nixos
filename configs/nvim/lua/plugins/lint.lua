return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        python = { "ruff" },  -- Make sure ruff is installed via NixOS
        -- Add other linters as needed
      },
    },
  },
}
