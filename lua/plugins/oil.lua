return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons" },

  lazy = false,

  config = function()
    local oil = require "oil"
    oil.setup()

    vim.keymap.set("n", "<leader>fe", oil.toggle_float)
  end,
}
