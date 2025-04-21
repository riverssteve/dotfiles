return {
  {
    -- Merged with main plugin definition
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- set to false to disable pyright entirely but be aware it's providing the lsp as well as
      -- linting...
      -- Also be aware of a local pyright configuration overriding these settings...
      local pyright = {
        settings = {
          pyright = {
            disableOrganizeImports = true, -- Using Ruff
          },
          python = {
            analysis = {
              ignore = { "*" }, -- Using Ruff
              typeCheckingMode = "off", -- Using mypy
            },
          },
        },
      }
      local yamlls = {

        settings = {
          yaml = {
            format = { enable = false, printWidth = 100 },
            schemaStore = {
              url = "https://www.schemastore.org/api/json/catalog.json",
              enable = true,
            },
            completion = true,
            validate = true,
          },
        },
      }
      opts.servers["pyright"] = pyright
      opts.servers["yamlls"] = yamlls
    end,
  },
}
