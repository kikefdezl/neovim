require "nvchad.mappings"
---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}

-- more keybinds!

M.custom = {
  n = {
    ["<leader>ru"] = {
      function ()
      	local terminal = require("nvterm.terminal")
        terminal.send('./run.sh')
      end, "Run ./run.sh file in terminal"},
 },
}

return M
