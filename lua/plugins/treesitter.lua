return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").install {
            "bash",
            "c",
            "css",
            "dockerfile",
            "go",
            "javascript",
            "jsx",
            "typescript",
            "tsx",
            "lua",
            "luadoc",
            "markdown",
            "markdown_inline",
            "python",
            "rust",
            "terraform",
            "toml",
            "yaml",
        }
    end,
}
