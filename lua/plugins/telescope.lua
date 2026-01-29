return {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable "make" == 1
      end,
    },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
  },
  config = function()
    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")

    -- See `:help telescope.builtin`
    local builtin = require "telescope.builtin"

    -- find files
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[S]earch [F]iles" })
    vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "[F]ind [R]ecent Files" })
    vim.keymap.set("n", "<leader>fh", function()
      builtin.find_files { hidden = true, no_ignore = true }
    end, { desc = "[F]ind [H]idden Files" })

    -- search
    vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
    vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
    vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
    vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
    vim.keymap.set("n", "<leader>sx", builtin.diagnostics, { desc = "[S]earch Diagnosti[x]" })
    vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
    vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

    vim.keymap.set("n", "<leader>s/", function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = "Live Grep in Open Files",
      }
    end, { desc = "[S]earch [/] in Open Files" })

    -- Neovim
    vim.keymap.set("n", "<leader>sn", function()
      builtin.find_files { cwd = vim.fn.stdpath "config" }
    end, { desc = "[S]earch [N]eovim files" })

    -- Dotfiles
    vim.keymap.set("n", "<leader>fd", function()
      builtin.find_files {
        cwd = "~/.dotfiles",
        hidden = true,
      }
    end, { desc = "[F]ind [D]otfiles" })

    -- Obsidian
    vim.keymap.set("n", "<leader>fo", function()
      require("lazy").load { plugins = { "obsidian.nvim" } }
      vim.cmd "ObsidianQuickSwitch"
    end, { desc = "[F]ind [O]bsidian file" })
    vim.keymap.set("n", "<leader>so", function()
      require("lazy").load { plugins = { "obsidian.nvim" } }
      vim.cmd "ObsidianSearch"
    end, { desc = "[S]earch [O]bsidian (grep)" })
  end,
}
