vim.pack.add { "https://github.com/stevearc/conform.nvim" }

require("conform").setup {
    notify_on_error = true,
    formatters_by_ft = {
        bash = { "shfmt" },
        go = { "gofumpt", "goimports" },
        json = { "jq" },
        javascript = { "biome" },
        javascriptreact = { "biome" },
        lua = { "stylua" },
        markdown = { "rumdl" },
        python = { "ruff_organize_imports", "ruff_format" },
        rust = { "rustfmt" },
        sh = { "shfmt" },
        shell = { "shfmt" },
        terraform = { "terraform_fmt" },
        typescript = { "biome" },
        typescriptreact = { "biome" },
    },
    formatters = {
        rustfmt = {
            options = {
                nightly = true,
            },
        },
    },
}

vim.keymap.set({ "n", "v" }, "<leader>fm", function()
    require("conform").format { async = true }
end, { desc = "[F]or[m]at buffer" })
