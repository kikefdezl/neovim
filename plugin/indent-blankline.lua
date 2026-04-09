vim.pack.add { "https://github.com/lukas-reineke/indent-blankline.nvim" }

require("ibl").setup {
    indent = { char = "▏" }, -- thinner than default
    scope = { enabled = false },
}
