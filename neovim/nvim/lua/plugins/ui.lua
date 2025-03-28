return {
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("config.lualine").setup_theme()
    end,
  },
  {
    {
      "yetone/avante.nvim",
      event = "VeryLazy",
      build = "make", -- This is Optional, only if you want to use tiktoken_core to calculate tokens count
      opts = {
        require("config.avante").opts(),
      },
      dependencies = {
        "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        --- The below is optional, make sure to setup it properly if you have lazy=true
        {
          "MeanderingProgrammer/render-markdown.nvim",
          opts = {
            file_types = { "markdown", "Avante" },
          },
          ft = { "markdown", "Avante" },
        },
      },
    },
  },
}
