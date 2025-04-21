vim.bo.textwidth = 120
vim.wo.colorcolumn = "+0"

-- Set up the key mapping for default behavior (using 'src')
vim.api.nvim_buf_set_keymap(
  0,
  "n",
  "<leader>cd",
  ':lua require("config.functions").copy_dot_path_to_file()<CR>',
  { desc = "copy dot path from src", noremap = true, silent = true }
)
