vim.cmd.packadd "opencode-collab.nvim"

require("opencode-collab").setup {
    sticky = false,
    toggler = {
        line = "<leader>/",
    },
    opleader = {
        line = "<leader>/",
    },
    post_hook = move_cursor_down,
}
