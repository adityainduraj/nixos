-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set(
  "n",
  "<leader>sx",
  require("telescope.builtin").resume,
  { noremap = true, silent = true, desc = "Resume Search" }
)

-- A keymap to get to the Dashboard faster
vim.keymap.set("n", "<leader>h", ":Dashboard<CR>", { noremap = true, silent = true, desc = "GoTo Dashboard" })
