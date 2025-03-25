return {
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        ["neotest-python"] = {
          dap = {
            justMyCode = false,
          },
          args = { "--color", "no", "--vv" },
          pytest_discover_instances = true,
        },
      },
    },
  },
}
