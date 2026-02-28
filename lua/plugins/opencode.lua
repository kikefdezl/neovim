return {
    "NickvanDyke/opencode.nvim",
    version = "*",
    dependencies = {
        { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
    },
    config = function()
        vim.env.GOOGLE_APPLICATION_CREDENTIALS = "/home/kike/.gcp/tooling-ai.json"
        vim.env.GOOGLE_VERTEX_LOCATION = "global"
        vim.env.GOOGLE_VERTEX_PROJECT = "tooling-ai"

        vim.g.opencode_opts = {}
        vim.o.autoread = true

        -- System notifications when Opencode is done processing or needs input
        vim.api.nvim_create_autocmd("User", {
            pattern = "OpencodeEvent:*",
            callback = function(args)
                local event = args.data.event
                if event.type == "session.idle" then
                    vim.notify("Opencode finished!", vim.log.levels.INFO)
                    vim.fn.system 'notify-send "Opencode" "Done!" --urgency=normal'
                elseif event.type == "question.asked" then
                    vim.notify("OpenCode is asking a question", vim.log.levels.WARN)
                    vim.fn.system 'notify-send "OpenCode" "Waiting for your input" --urgency=normal'
                end
            end,
        })

        -- Your existing keymaps
        vim.keymap.set({ "n", "x" }, "<A-a>", function()
            require("opencode").ask("@this: ", { submit = true })
        end, { desc = "[A]sk opencode" })
        vim.keymap.set({ "n", "x" }, "<C-x>", function()
            require("opencode").select()
        end, { desc = "E[x]ecute opencode action…" })
        vim.keymap.set({ "n", "t" }, "<A-o>", function()
            require("opencode").toggle()
        end, { desc = "Toggle [o]pencode" })
        vim.keymap.set({ "n", "x" }, "go", function()
            return require("opencode").operator "@this "
        end, { expr = true, desc = "Add range to opencode" })
        vim.keymap.set("n", "goo", function()
            return require("opencode").operator "@this " .. "_"
        end, { expr = true, desc = "Add line to opencode" })
        vim.keymap.set("n", "<S-C-u>", function()
            require("opencode").command "session.half.page.up"
        end, { desc = "opencode half page up" })
        vim.keymap.set("n", "<S-C-d>", function()
            require("opencode").command "session.half.page.down"
        end, { desc = "opencode half page down" })
    end,
}
