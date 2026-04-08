-- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
-- used for completion, annotations and signatures of Neovim apis
vim.api.nvim_create_autocmd("FileType", {
    pattern = "lua",
    once = true,
    callback = function()
        vim.pack.add({ "https://github.com/folke/lazydev.nvim" })
        require("lazydev").setup({
            library = {
                -- Load luvit types when the `vim.uv` word is found
                { path = "luvit-meta/library", words = { "vim%.uv" } },
            },
            integrations = {
                lspconfig = true,
            },
        })
    end,
})
