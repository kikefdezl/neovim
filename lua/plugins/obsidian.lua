local vault = vim.fn.expand "~" .. "/Obsidian"

return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  cmd = { "ObsidianSearch" },
  event = {
    -- These events are to only load obsidian.nvim when opening files in my vault
    ("BufReadPre " .. vault .. "/*.md"),
    ("BufNewFile " .. vault .. "/*.md"),
  },
  dependencies = { "nvim-lua/plenary.nvim" },

  config = function()
    require("obsidian").setup {
      workspaces = {
        {
          name = "kike",
          path = vault,
        },
      },

      disable_frontmatter = true,
    }

    vim.opt.conceallevel = 2
  end,
}
