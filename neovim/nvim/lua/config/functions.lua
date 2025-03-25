local M = {}

M.copy_relative_path = function()
  -- Get the relative path of the current buffer
  local relative_path = vim.fn.fnamemodify(vim.fn.expand("%"), ":.")

  -- Copy to clipboard
  vim.fn.setreg("+", relative_path)

  -- Optional: Show a notification to user
  vim.notify("Copied path: " .. relative_path, vim.log.levels.INFO)
end

M.copy_dot_path_to_file = function(custom_root)
  -- Get the full path of the current buffer
  local full_path = vim.fn.expand("%:p")

  -- Define the root to search for (default is 'src')
  local root = custom_root or "src"

  -- Find the position of the root directory in the path
  local root_pos = full_path:find("/" .. root .. "/")

  if root_pos then
    -- If root is found, start from there
    full_path = full_path:sub(root_pos + 1)
  else
    -- If root is not found, start from the last directory
    full_path = vim.fn.expand("%:t")
  end

  -- Remove the file extension
  local path = full_path:gsub("%.%w+$", "")

  -- Replace '/' with '.'
  path = path:gsub("/", ".")

  -- Copy to clipboard
  vim.fn.setreg("+", path)
end

return M
