return {
  "stevearc/conform.nvim",
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>fm",
      function()
        require("conform").format { async = true }
      end,
      mode = "",
      desc = "[F]or[m]at buffer",
    },
  },
  opts = {
    notify_on_error = true,
    formatters_by_ft = {
      go = { "gofumpt", "goimports" },
      json = { "jq" },
      javascript = { "biome" },
      javascriptreact = { "biome" },
      lua = { "stylua" },
      python = { "ruff_organize_imports", "ruff_format" },
      markdown = { "rumdl" },
      rust = { "rustfmt" },
      terraform = { "terraform_fmt" },
      typescript = { "biome" },
      typescriptreact = { "biome" },
    },
  },
}
