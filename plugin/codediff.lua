vim.pack.add { "https://github.com/esmuellert/codediff.nvim" }

require("codediff").setup {
    explorer = {
        view_mode = "tree",
    },
    keymaps = {
        view = {
            toggle_stage = "s",
        },
    },
}

vim.keymap.set("n", "<A-g>", ":CodeDiff<CR>", { desc = "Toggle [g]it codediff" })
vim.keymap.set("n", "<leader>go", ":CodeDiff<CR>", { desc = "[g]it codediff [o]pen" })
