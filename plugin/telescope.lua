-- Autocommand to compile fzf-native on install/update
vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(ev)
        if ev.data.spec.name == "telescope-fzf-native.nvim" and vim.fn.executable("make") == 1 then
            -- wait for pack.add to finish installing so the path exists, though PackChanged after install handles it
            vim.fn.system({ "make", "-C", vim.fn.stdpath("data") .. "/site/pack/core/opt/telescope-fzf-native.nvim" })
        end
    end
})

-- <leader>f is for finding [f]iles
-- <leader>s is for [s]earching within files
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        local plugins = {
            "https://github.com/nvim-lua/plenary.nvim",
            "https://github.com/nvim-telescope/telescope-ui-select.nvim",
            "https://github.com/nvim-tree/nvim-web-devicons",
            "https://github.com/nvim-telescope/telescope.nvim"
        }
        
        if vim.fn.executable("make") == 1 then
            table.insert(plugins, 2, "https://github.com/nvim-telescope/telescope-fzf-native.nvim")
        end
        
        vim.pack.add(plugins)

        pcall(require("telescope").load_extension, "fzf")
        pcall(require("telescope").load_extension, "ui-select")

        local builtin = require("telescope.builtin")

        -- find files
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[S]earch [F]iles" })
        vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "[F]ind [R]ecent Files" })
        vim.keymap.set("n", "<leader>fh", function()
            builtin.find_files({ hidden = true, no_ignore = true })
        end, { desc = "[F]ind [H]idden Files" })
        vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind [b]uffers" })

        -- search
        vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
        vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
        vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
        vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
        vim.keymap.set("n", "<leader>sx", builtin.diagnostics, { desc = "[S]earch Diagnosti[x]" })
        vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
        vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

        vim.keymap.set("n", "<leader>s/", function()
            builtin.live_grep({
                grep_open_files = true,
                prompt_title = "Live Grep in Open Files",
            })
        end, { desc = "[S]earch [/] in Open Files" })

        -- Neovim
        vim.keymap.set("n", "<leader>fn", function()
            builtin.find_files({ cwd = vim.fn.stdpath("config") })
        end, { desc = "[F]ind [N]eovim file" })
        vim.keymap.set("n", "<leader>sn", function()
            builtin.live_grep({ cwd = vim.fn.stdpath("config") })
        end, { desc = "[S]earth in [N]eovim files" })

        -- Dotfiles
        vim.keymap.set("n", "<leader>fd", function()
            builtin.find_files({
                cwd = "~/.dotfiles",
                hidden = true,
            })
        end, { desc = "[F]ind in [D]otfiles" })

        -- Obsidian (removed lazy.nvim code)
        vim.keymap.set("n", "<leader>fo", function()
            vim.cmd("Obsidian quick_switch")
        end, { desc = "[F]ind [O]bsidian file" })
        vim.keymap.set("n", "<leader>so", function()
            vim.cmd("Obsidian search")
        end, { desc = "[S]earch [O]bsidian (grep)" })
    end
})
