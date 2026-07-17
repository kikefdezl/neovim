local vault = vim.fn.expand "~" .. "/Obsidian"

vim.pack.add {
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-telescope/telescope.nvim",
    {
        src = "https://github.com/obsidian-nvim/obsidian.nvim",
        version = "main",
    },
}

require("obsidian").setup {
    picker = {
        name = "telescope.nvim",
    },
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
}

vim.opt.conceallevel = 0
vim.keymap.set("n", "<leader>dn", ":Obsidian today<CR>", { desc = "Obsidian [d]aily [n]ote" })
