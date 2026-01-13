return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },

  config = function()
    vim.keymap.set("n", "<leader>do", ":DiffviewOpen<CR>")
    vim.keymap.set("n", "<leader>dc", ":DiffviewClose<CR>")
  end,
}
