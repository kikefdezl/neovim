vim.pack.add {
    "https://github.com/Saghen/blink.lib",
    "https://github.com/Saghen/blink.cmp",
}

require("blink.cmp").build()

require("blink.cmp").setup {
    keymap = { preset = "default" },
    appearance = {
        nerd_font_variant = "mono",
    },
    completion = {
        list = {
            selection = {
                preselect = false,
                auto_insert = true,
            },
        },
        documentation = { auto_show = false },
    },
    sources = {
        default = { "lsp", "path", "snippets", "buffer" },
    },
    fuzzy = {
        implementation = "prefer_rust_with_warning",
    },
}
