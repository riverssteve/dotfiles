local M = {}

M.options = {
  html = {
    comment = {
      conceal = false,
    },
  },
}

function M.setup()
  local render_markdown = require("render-markdown")

  render_markdown.setup(M.options)
end

return M
