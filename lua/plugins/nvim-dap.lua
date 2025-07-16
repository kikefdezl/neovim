return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "mfussenegger/nvim-dap-python",
  },
  config = function()
    local dap = require "dap"

    -- UI
    local dapui = require "dapui"
    dapui.setup()
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

    -- keymaps
    vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)

    vim.keymap.set("n", "<F1>", dap.continue)
    vim.keymap.set("n", "<F12>", dap.restart)

    vim.keymap.set("n", "<leader>dl", dapui.toggle, { desc = "[D]ebugger togg[l]e"})
    vim.keymap.set("n", "<leader>do", dapui.open, { desc = "[D]ebugger [o]pen" })
    vim.keymap.set("n", "<leader>dc", dapui.close, { desc = "[D]ebugger [c]lose" })

    -- python --
    require("dap-python").setup "uv"

    -- NOTE: this doesn't actually work right now
    local ensure_installed = { debugpy = {} }
    require("mason-tool-installer").setup { ensure_installed = ensure_installed }

  end,
}
