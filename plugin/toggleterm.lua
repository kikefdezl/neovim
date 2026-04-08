vim.pack.add {
    { src = "https://github.com/akinsho/toggleterm.nvim", version = "main" },
}

require("toggleterm").setup {
    open_mapping = [[<A-h>]],
    shade_terminals = true,
    direction = "float", -- horizontal, vertical, float or tab
}
