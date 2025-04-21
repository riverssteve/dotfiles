return {
  "dense-analysis/ale",
  config = function()
    -- Configuration goes here.
    local g = vim.g

    -- Detect whether the file is inside a poetry, and set the executable to `poetry`
    -- if true. This is overridden by a manually-set executable.
    g.ale_python_mypy_auto_poetry = 1
    g.ale_python_ruff_format_options = "--config pyproject.toml"

    g.ale_linters = {
      python = {
        "ruff",
        "ruff_format",
        "mypy",
        "trim_whitespace",
      },
      lua = { "lua_language_server" },
    }
  end,
}
