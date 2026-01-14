return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },

  config = function()
    vim.keymap.set("n", "<leader>go", ":DiffviewOpen<CR>")
    vim.keymap.set("n", "<leader>gq", ":DiffviewClose<CR>")

    vim.opt.fillchars = vim.opt.fillchars + "diff:╱"

    require("diffview").setup {
      enhanced_diff_hl = true,
    }
  end,
}
