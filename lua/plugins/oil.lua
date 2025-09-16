return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons" },

  lazy = false,

  config = function()
    local oil = require "oil"
    oil.setup {
      default_file_explorer = true,
      view_options = {
        show_hidden = true,
      },
      keymaps = {
        ["<leader>h"] = { "actions.toggle_hidden", mode = "n" },
      },
    }

    vim.keymap.set("n", "-", oil.open)
    vim.keymap.set("n", "<leader>fe", oil.toggle_float)
  end,
}
