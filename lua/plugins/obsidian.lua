local vault = vim.fn.expand "~" .. "/Obsidian"

return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = false,
  cmd = { "ObsidianSearch" },
  dependencies = { "nvim-lua/plenary.nvim" },

  config = function()
    require("obsidian").setup {
      workspaces = {
        {
          name = "kike",
          path = vault,
        },
      },

      daily_notes = {
        folder = "Daily Notes/",
      },

      disable_frontmatter = true,
    }

    vim.opt.conceallevel = 2

    vim.keymap.set("n", "<leader>dn", "<cmd>ObsidianToday<CR>", { desc = "Obsidian [d]aily [n]ote" })
  end,
}
