return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        marksman = {
          -- Set the cmd to the path of your system-installed marksman
          cmd = { "/run/current-system/sw/bin/marksman", "server" }
        },
      },
    },
  },
}
