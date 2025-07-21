return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "mfussenegger/nvim-dap-python",
  },
  config = function()
    local dap = require "dap"

    -- keymaps
    vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
    vim.keymap.set("n", "<F1>", dap.continue)
    vim.keymap.set("n", "<F12>", dap.restart)

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
