return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install {
      "bash",
      "c",
      "dockerfile",
      "go",
      "javascript",
      "typescript",
      "lua",
      "luadoc",
      "markdown",
      "python",
      "rust",
    }
  end,
}
