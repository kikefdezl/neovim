-- NOTE: With the new "main" default branch, you need to have tree-sitter-cli 
-- installed in the system, or you get a "nvim-treesitter/compiling/language" message 
-- on every startup.
return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install {
      "bash",
      "c",
      "diff",
      "dockerfile",
      "go",
      "javascript",
      "typescript",
      "lua",
      "luadoc",
      "markdown",
      "python",
      "rust",
      "vim",
      "vimdoc",
    }
  end,
  -- main = "nvim-treesitter.configs",
  -- opts = {
  --   ensure_installed = {
  --     "bash",
  --     "c",
  --     "diff",
  --     "dockerfile",
  --     "html",
  --     "lua",
  --     "luadoc",
  --     "markdown",
  --     "markdown_inline",
  --     "python",
  --     "rust",
  --     "terraform",
  --     "query",
  --     "vim",
  --     "vimdoc",
  --   },
  --   auto_install = true,
  --   highlight = {
  --     enable = true,
  --   },
  -- },
}
