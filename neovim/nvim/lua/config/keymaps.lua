-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Restore keys for moving to top and bottom of window to g<x>
vim.keymap.set({ "n", "x" }, "gh", "<s-h>", { desc = "Move cursor to top of window" })
vim.keymap.set({ "n", "x" }, "gm", "<s-m>", { desc = "Move cursor to center of window" })
vim.keymap.set({ "n", "x" }, "gl", "<s-l>", { desc = "Move cursor to bottom of window" })

-- Copy the current filename to a buffer
vim.api.nvim_set_keymap(
  "n",
  "<leader>cf",
  "<cmd>let @+=@%<CR>",
  { desc = "Copy current filename to buffer", noremap = true, silent = true }
)

-- Copy relative file path
vim.keymap.set("n", "<leader>cp", require("config.functions").copy_relative_path, { desc = "Copy relative file path" })

-- Set up the key mapping for default behavior (using 'src')
vim.api.nvim_set_keymap(
  "n",
  "<leader>cd",
  ":lua require('config.functions').copy_dot_path_to_file()<CR>",
  { desc = "copy dot path from src", noremap = true, silent = true }
)
