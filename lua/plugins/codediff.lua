return {
    "esmuellert/codediff.nvim",
    cmd = "CodeDiff",
    keys = {
        { "<A-g>", ":CodeDiff<CR>", desc = "Toggle [g]it codediff" },
        { "<leader>go", ":CodeDiff<CR>", desc = "[g]it codediff [o]pen" },
    },
    opts = {
        explorer = {
            view_mode = "tree",
        },
        keymaps = {
            view = {
                toggle_stage = "s",
            },
        },
    },
}
