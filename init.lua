vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

-- Replace your BufEnter autocmd with this:
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local mapping = vim.fn.maparg("-", "n", false, true)
    if mapping.rhs and not string.match(mapping.rhs, "Oil") then
      print("WARNING: - remapped to decrement")
      print("Stack trace:")
      print(debug.traceback())
    end
    vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory" })
  end
})

-- Options
require "options"

-- Keymaps
require "keymaps"

-- Autocommands
require "autocommands"

-- Plugins
require "plugins"
