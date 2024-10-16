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
  "tpope/vim-sleuth",
  { "Bilal2453/luvit-meta", lazy = true },

  require "plugins.comment",
  require "plugins.gitsigns",
  require "plugins.toggleterm",
  require "plugins.which-key",
  require "plugins.telescope",
  require "plugins.lazydev",
  require "plugins.nvim-lspconfig",
  require "plugins.conform",
  require "plugins.nvim-cmp",
  require "plugins.todo-comments",
  require "plugins.colorscheme",
  require "plugins.mini",
  require "plugins.treesitter",
  require "plugins.neo-tree",
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
