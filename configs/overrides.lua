local M = {}

M.treesitter = {
  ensure_installed = {
    "python",
    "rust",
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "c",
    "markdown",
    "markdown_inline",
  },
  indent = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = {
    -- lua
    "lua-language-server",
    "stylua",

    -- python
    "pyright",  -- lsp
    "ruff",  -- linter
    "black",  -- formatter
    "isort",  -- import organizer

    -- rust
    "rust_analyzer"  -- linter
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
