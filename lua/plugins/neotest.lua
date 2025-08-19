return {
  "nvim-neotest/neotest",

  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    -- add required adapters here --
    "nvim-neotest/neotest-python",
    "mrcjkb/rustaceanvim",
  },

  config = function()
    local neotest = require "neotest"

    neotest.setup {
      adapters = {
        -- also add them here --
        require "neotest-python",
        require "rustaceanvim.neotest",
      },
    }

    -- keymaps --
    vim.keymap.set("n", "<leader>tr", function()
      neotest.run.run()
      neotest.output.open()
    end, { desc = "[r]un the nearest [t]est" })

    vim.keymap.set("n", "<leader>td", function()
      neotest.run.run { strategy = "dap" }
    end, { desc = "[d]ebug the nearest [t]est" })

    vim.keymap.set("n", "<leader>tf", function()
      neotest.run.run(vim.fn.expand "%")
    end, { desc = "[T]est the entire [f]ile" })

    vim.keymap.set("n", "<leader>ts", neotest.summary.toggle, { desc = "[T]est [s]ummary" })

    vim.keymap.set("n", "<leader>to", function()
      neotest.output.open()
    end, { desc = "[o]pen the [t]est output panel" })

    vim.keymap.set("n", "<leader>tc", function()
      neotest.run.stop()
    end, { desc = "[c]ancel the nearest [t]est" })
  end,
}
