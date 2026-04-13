vim.pack.add { "https://github.com/folke/snacks.nvim" }

require("snacks").setup {
    picker = { enabled = true },
}

local picker = Snacks.picker

-- <leader>f - [f]ind files
-- <leader>s - [s]earch (grep) within them
-- that's how it *clicks* in the smol brain of mine

-- find
vim.keymap.set("n", "<leader>ff", picker.files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>fr", picker.recent, { desc = "[F]ind [R]ecent Files" })
vim.keymap.set("n", "<leader>fh", function()
    picker.files { hidden = true, ignored = true }
end, { desc = "[F]ind [H]idden Files" })
vim.keymap.set("n", "<leader>fb", picker.buffers, { desc = "[F]ind [b]uffers" })
vim.keymap.set("n", "<leader>fn", function()
    picker.files { cwd = vim.fn.stdpath "config" }
end, { desc = "[F]ind [N]eovim file" })
vim.keymap.set("n", "<leader>fo", function()
    vim.cmd "Obsidian quick_switch"
end, { desc = "[F]ind [O]bsidian file" })
vim.keymap.set("n", "<leader>fd", function()
    picker.files {
        cwd = "~/.dotfiles",
        hidden = true,
        ignored = true
    }
end, { desc = "[F]ind in [D]otfiles" })

-- search
vim.keymap.set("n", "<leader>sh", picker.help, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sk", picker.keymaps, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>sw", picker.grep_word, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", picker.grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sx", picker.diagnostics, { desc = "[S]earch Diagnosti[x]" })
vim.keymap.set("n", "<leader>sr", picker.resume, { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader>sn", function()
    picker.grep { cwd = vim.fn.stdpath "config" }
end, { desc = "[S]earch in [N]eovim files" })
vim.keymap.set("n", "<leader>so", function()
    vim.cmd "Obsidian search"
end, { desc = "[S]earch [O]bsidian (grep)" })
vim.keymap.set("n", "<leader>s/", function()
    picker.grep_buffers()
end, { desc = "[S]earch [/] in Open Files" })


vim.keymap.set("n", "<leader><leader>", picker.buffers, { desc = "[ ] Find existing buffers" })

