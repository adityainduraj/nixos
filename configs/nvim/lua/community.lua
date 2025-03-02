-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.colorscheme.gruvbox-nvim" },
  { import = "astrocommunity.colorscheme.vscode-nvim" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.editing-support.copilotchat-nvim" },
  { import = "astrocommunity.game.leetcode-nvim" },
  { import = "astrocommunity.colorscheme.miasma-nvim" },
  { import = "astrocommunity.colorscheme.hybrid-nvim" },
  { import = "astrocommunity.pack.rust" },
  -- { import = "astrocommunity.colorscheme.onedarkpro-nvim" },
  -- { import = "astrocommunity.colorscheme.oxocarbon-nvim" },
  -- { import = "astrocommunity.colorscheme.gruvbox-baby" }
  -- import/override with your plugins folder
}
