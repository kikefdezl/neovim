vim.pack.add({ "https://github.com/numToStr/Comment.nvim" })

local function move_cursor_down()
    vim.api.nvim_command("normal! j")
end

require("Comment").setup({
    sticky = false,
    toggler = {
        line = "<leader>/",
    },
    opleader = {
        line = "<leader>/",
    },
    post_hook = move_cursor_down,
})
