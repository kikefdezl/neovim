return {
  "nvim-neotest/neotest",

  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    -- add required adapters here --
    "nvim-neotest/neotest-python",
    "rouge8/neotest-rust",
  },

  config = function()
    local neotest = require("neotest")

    neotest.setup({
      adapters = {
        -- also add them here --
        require("neotest-python"),
        require("neotest-rust"),
      }
    })

    -- keymaps --
    vim.keymap.set("n", "<leader>tr", function()
      neotest.run.run()
      neotest.output.open()
    end, { desc = "[r]un the nearest [t]test" })

    vim.keymap.set("n", "<leader>tf", function()
      neotest.run.run(vim.fn.expand("%"))
    end, { desc = "[T]est the entire [f]ile" })

    vim.keymap.set("n", "<leader>ts", neotest.summary.toggle, { desc = "[T]est [s]ummary" })
  end }
