local function move_cursor_down()
  vim.api.nvim_command "normal! j"
end

return {
  "numToStr/Comment.nvim",
  opts = {
    sticky = false,
    toggler = {
      line = "<leader>/",
    },
    opleader = {
      line = "<leader>/",
    },
    post_hook = move_cursor_down,
  },
}
