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
    "json",
    "yaml"
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
    "ruff",

    -- rust
    "rust-analyzer",

    -- json
    "json-lsp",

    -- yaml
    "yaml-language-server",
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
