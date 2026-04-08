vim.pack.add {
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
}

require("nvim-treesitter").install {
    "bash",
    "c",
    "css",
    "dockerfile",
    "go",
    "html",
    "javascript",
    "json",
    "jsx",
    "just",
    "regex",
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
    "xml",
    "yaml",
}

-- Enable treesitter highlighting for all filetypes
vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
        pcall(vim.treesitter.start, args.buf)
    end,
})
