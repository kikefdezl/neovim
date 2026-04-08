vim.pack.add({
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/stevearc/oil.nvim",
})

local oil = require("oil")

oil.setup({
    default_file_explorer = true,
    view_options = {
        show_hidden = true,
    },
    keymaps = {
        ["<leader>h"] = { "actions.toggle_hidden", mode = "n" },
        ["<C-h>"] = false,
        ["<C-l>"] = false,
        ["<C-k>"] = false,
        ["<C-j>"] = false,
    },
})

vim.keymap.set("n", "-", oil.open)
vim.keymap.set("n", "<leader>fe", oil.toggle_float)
