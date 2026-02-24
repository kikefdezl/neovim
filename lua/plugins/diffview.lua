return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },

  config = function()
    vim.keymap.set("n", "<leader>go", ":DiffviewOpen<CR>", { desc = "[g]it diff [o]pen" })
    vim.keymap.set("n", "<leader>gq", ":DiffviewClose<CR>", { desc = "[g]it diff [q]uit" })

    vim.opt.fillchars = vim.opt.fillchars + "diff:╱"

    require("diffview").setup {
      enhanced_diff_hl = true,
    }
  end,
}
