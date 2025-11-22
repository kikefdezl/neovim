-- Populates a .vscode/launch.json with a Python launch template if it doesn't already exist
vim.api.nvim_create_user_command("DapCreateLaunchPython", function()
  local vscode_dir = vim.fn.getcwd() .. "/.vscode"
  local launch_file = vscode_dir .. "/launch.json"

  if vim.fn.filereadable(launch_file) == 1 then
    print "launch.json already exists"
    return
  end

  vim.fn.mkdir(vscode_dir, "p")

  local template = [[{
  "configurations": [
    {
      "type": "python",
      "request": "launch",
      "name": "Debug",
      "program": "${workspaceFolder}/main.py",
      "args": [],
      "env": {
        "APP_FOO": "bar",
        "NODE_ENV": "test"
      },
      "console": "integratedTerminal"
    }
  ]
}]]

  local f = assert(io.open(launch_file, "w"), "failed to open file")
  f:write(template)
  f:close()

  vim.cmd("edit " .. launch_file)
end, {})

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
