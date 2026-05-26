vim.pack.add {
    "https://github.com/MeanderingProgrammer/render-markdown.nvim",
}

require("render-markdown").setup {
    anti_conceal = { enabled = true },
    file_types = { "markdown", "opencode_output" },
    heading = {
        enabled = true,
        render_modes = true,
        atx = false,
    },
    bullet = {
        icons = { "•", "◦", "◆", "◇" },
        right_pad = 1,
    },
}
