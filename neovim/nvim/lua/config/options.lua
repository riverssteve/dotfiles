-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Set the virtualenv that neovim uses behind the scenes.
--
--   $ pyenv local 3.12.3
--   $ python -V
--   >>> 3.12.3
--
--   $ pip install pynvim
--
-- And then in neovim run :checkhealth and ensure that the following is selected.
vim.g.python3_host_prog = "/Users/steve.rivers/.virtualenvs/neovim/bin/python3"
vim.g.node_host_prog = "/opt/homebrew/bin/node"

-- https://stackoverflow.com/questions/53835289/iterm2-cursor-scrolling-with-mouse-enabled-in-vim
-- Here so that I can see this when I inevitably wonder why scrolling inside neovim isn't working :)
