return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          cmd = { "/run/current-system/sw/bin/clangd" }  -- Path to NixOS system clangd
        },
      },
    },
  },
}
