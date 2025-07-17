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

    vim.cmd "hi DapBreakpointColor guifg=#fa4848"
    vim.fn.sign_define("DapBreakpoint", { text = " ", texthl = "DapBreakpointColor", linehl = "", numhl = ""})

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
    vim.keymap.set("n", "<leader>dl", dapui.toggle, { desc = "[D]ebugger togg[l]e" })
    vim.keymap.set("n", "<leader>do", dapui.open, { desc = "[D]ebugger [o]pen" })
    vim.keymap.set("n", "<leader>dc", dapui.close, { desc = "[D]ebugger [c]lose" })

    -- this loads custom debug DAP configurations written in .nvim/dap.lua (in your current repo)
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        local project_dap = vim.fn.getcwd() .. "/.nvim/dap.lua"
        if vim.fn.filereadable(project_dap) == 1 then
          dofile(project_dap)
        end
      end,
    })

    ----- PYTHON ------
    require("dap-python").setup "uv"
    -- NOTE: mason ensure_installed debupy does't actually work right now
    local ensure_installed = { debugpy = {} }
    require("mason-tool-installer").setup { ensure_installed = ensure_installed }
    require("dap").configurations.python = {
      {
        type = "python",
        request = "launch",
        name = "file",
        program = "${file}",
      },
      {
        type = "python",
        request = "launch",
        name = "file:args",
        program = "${file}",
        args = function()
          local args_string = vim.fn.input "Arguments: "
          local utils = require "dap.utils"
          if utils.splitstr and vim.fn.has "nvim-0.10" == 1 then
            return utils.splitstr(args_string)
          end
          return vim.split(args_string, " +")
        end,
      },
    }
  end,
}
