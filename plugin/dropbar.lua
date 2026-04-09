vim.pack.add { "https://github.com/Bekaboo/dropbar.nvim" }

local dropbar_api = require "dropbar.api"

vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })

vim.api.nvim_set_hl(0, "WinBar", { bg = "NONE", fg = "NONE" }) -- sets the color of the bar bg to transparent
