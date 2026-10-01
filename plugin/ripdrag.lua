-- vim.cmd.packadd "ripdrag.nvim"
vim.pack.add { "https://github.com/kikefdezl/ripdrag.nvim" }

require("ripdrag").setup {
    keymap = "<C-n>",
}
