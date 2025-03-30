return {
  "nvim-neo-tree/neo-tree.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  keys = {
    { "<leader>e", ":Neotree toggle<CR>", desc = "Toggle File [E]xplorer", silent = true },
  },
  opts = {
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
      },
      window = {
        mappings = {
          ["\\"] = "close_window",
          ["/"] = "none", -- unsets the fuzzy finder for "/"
          ["%"] = "add",
          ["c"] = "copy",
        },
      },
    },
  },
}
