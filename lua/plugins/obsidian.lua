local vault = vim.fn.expand "~" .. "/Obsidian"
return {
    "obsidian-nvim/obsidian.nvim",
    version = "*",
    lazy = false, -- Need to load the `leader>dn` shortcut for daily notes from anywhere
    dependencies = { "nvim-lua/plenary.nvim" },
    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
        workspaces = {
            {
                name = "kike",
                path = vault,
            },
        },
        daily_notes = {
            folder = "Daily Notes/",
        },
        legacy_commands = false,
        frontmatter = {
            enabled = false,
        },
        checkbox = {
            create_new = false,
        },
    },

    config = function(_, opts)
        require("obsidian").setup(opts)
        vim.opt.conceallevel = 2
        vim.keymap.set("n", "<leader>dn", ":Obsidian today<CR>", { desc = "Obsidian [d]aily [n]ote" })
    end,
}
