vim.pack.add({
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/folke/snacks.nvim",
    "https://github.com/MeanderingProgrammer/render-markdown.nvim",
    "https://github.com/sudo-tee/opencode.nvim",
})

-- Dependencies setup
require("snacks").setup({ input = {}, picker = {}, terminal = {} })
require("render-markdown").setup({
    anti_conceal = { enabled = false },
    file_types = { "markdown", "opencode_output" },
})

-- Opencode setup
vim.o.autoread = true

require("opencode").setup({
    keymap = {
        editor = {
            ["<A-o>"] = { "toggle", help = "Toggles [O]pencode" },
            ["<A-i>"] = { "open_input", mode = { "n", "x" }, help = "Opens Opencode in [i]nput mode" },
            ["<A-q>"] = { "quick_chat", mode = { "n", "x" }, help = "[Q]uick chat" },
        },
    },
    -- System notifications
    hooks = {
        on_done_thinking = function()
            vim.notify("Opencode finished!", vim.log.levels.INFO)
            vim.fn.system('notify-send "Opencode" "Done!" --urgency=normal')
        end,
        on_permission_requested = function()
            vim.notify("OpenCode is asking a question", vim.log.levels.WARN)
            vim.fn.system('notify-send "OpenCode" "Waiting for your input" --urgency=normal')
        end,
    },
})
