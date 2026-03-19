return {
    "sudo-tee/opencode.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
        {
            "MeanderingProgrammer/render-markdown.nvim",
            opts = {
                anti_conceal = { enabled = false },
                file_types = { "markdown", "opencode_output" },
            },
            ft = { "markdown", "opencode_output" },
        },
    },
    config = function()
        vim.o.autoread = true

        require("opencode").setup {
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
                    vim.fn.system 'notify-send "Opencode" "Done!" --urgency=normal'
                end,
                on_permission_requested = function()
                    vim.notify("OpenCode is asking a question", vim.log.levels.WARN)
                    vim.fn.system 'notify-send "OpenCode" "Waiting for your input" --urgency=normal'
                end,
            },
        }
    end,
}
