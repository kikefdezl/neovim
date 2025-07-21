return {
  "rcarriga/nvim-dap-ui",
  lazy = false,
  dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  opts = {
    layouts = {
      {
        elements = {
          { id = "console", size = 0.5 },
          { id = "repl", size = 0.5 },
        },
        position = "left",
        size = 35,
      },
      {
        elements = {
          { id = "scopes", size = 0.80 },
          { id = "breakpoints", size = 0.20 },
          -- { id = "stacks", size = 0.15 },
          -- { id = "watches", size = 0.15 },
        },
        position = "bottom",
        size = 12,
      },
    },
  },

  config = function(_, opts)
    local dap = require "dap"
    local dapui = require "dapui"

    dapui.setup(opts)

    -- keymaps
    vim.keymap.set("n", "<leader>dl", dapui.toggle, { desc = "[D]ebugger togg[l]e" })
    vim.keymap.set("n", "<leader>do", dapui.open, { desc = "[D]ebugger [o]pen" })
    vim.keymap.set("n", "<leader>dc", dapui.close, { desc = "[D]ebugger [c]lose" })

    -- styling
    vim.cmd "hi DapBreakpointColor guifg=#fa4848"
    vim.fn.sign_define("DapBreakpoint", { text = " ", texthl = "DapBreakpointColor", linehl = "", numhl = "" })

    -- autocommands
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
  end,
}
