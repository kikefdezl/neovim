vim.pack.add({
    "https://github.com/mfussenegger/nvim-dap",
    { src = "https://github.com/mrcjkb/rustaceanvim", version = "^6" },
})

-- NOTE: rustaceanvim sets up LSP for us, so don't configure it
-- via nvim-lspconfig as it may cause conflicts.
-- Also, it just happens to magically interface with nvim-dap as
-- long as codelldb is installed.

-- rustaceanvim is configured via a global table instead of a setup function
vim.g.rustaceanvim = function()
    return {
        -- TODO: requires `codelldb`, ensure installed with Mason
        dap = {},
    }
end
