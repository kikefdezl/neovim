local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error("Error cloning lazy.nvim:\n" .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  require "plugins.colorschemes.nordic",
  require "plugins.comment",
  require "plugins.conform",
  require "plugins.dropbar",
  require "plugins.gitsigns",
  require "plugins.helm-ls",
  require "plugins.lazydev",
  require "plugins.nvim-cmp",
  require "plugins.nvim-dap",
  require "plugins.nvim-dap-ui",
  require "plugins.nvim-colorizer",
  require "plugins.nvim-lspconfig",
  require "plugins.mini",
  require "plugins.neotest",
  require "plugins.obsidian",
  require "plugins.oil",
  require "plugins.rustaceanvim",
  require "plugins.sleuth",
  require "plugins.telescope",
  require "plugins.todo-comments",
  require "plugins.toggleterm",
  require "plugins.treesitter",
  require "plugins.which-key",
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      require = "🌙",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
})

require "custom.mltop"
