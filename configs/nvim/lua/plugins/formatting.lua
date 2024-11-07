return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "black" },  -- Make sure black is installed via NixOS
        lua = { "stylua" },    -- Make sure stylua is installed via NixOS
        -- Add other formatters as needed
      },
    },
  },
}
