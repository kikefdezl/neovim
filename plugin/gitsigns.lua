vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })

require("gitsigns").setup({
    signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
    },
    on_attach = function(bufnr)
        local gitsigns = require("gitsigns")

        vim.keymap.set(
            { "n", "v" },
            "<leader>ga",
            gitsigns.stage_hunk,
            { desc = "[G]it [A]ccept hunk (stages it)", buffer = bufnr }
        )
        vim.keymap.set({ "n", "v" }, "<leader>gX", gitsigns.reset_hunk, { desc = "Rejet hunk (restores it)", buffer = bufnr })
        vim.keymap.set("n", "<leader>gb", gitsigns.blame_line, { desc = "git [b]lame line", buffer = bufnr })
    end,
})
