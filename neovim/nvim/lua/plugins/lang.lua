return {
  {
    "jparise/vim-graphql",
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    config = function()
      require("config.render_markdown").setup()
    end,
  },
}
