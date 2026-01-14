return {
  "NickvanDyke/opencode.nvim",
  dependencies = {
    { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
  },
  config = function()
    vim.env.GOOGLE_APPLICATION_CREDENTIALS = "/home/kike/.gcp/tooling-ai.json"
    vim.env.GOOGLE_VERTEX_LOCATION = "global"
    vim.env.GOOGLE_VERTEX_PROJECT = "tooling-ai"

    vim.g.opencode_opts = {}

    vim.o.autoread = true

    vim.keymap.set({ "n", "x" }, "<A-a>", function()
      require("opencode").ask("@this: ", { submit = true })
    end, { desc = "[A]sk opencode" })
    vim.keymap.set({ "n", "x" }, "<C-x>", function()
      require("opencode").select()
    end, { desc = "E[x]ecute opencode action…" })
    vim.keymap.set({ "n", "t" }, "<A-o>", function()
      require("opencode").toggle()
    end, { desc = "Toggle [o]pencode" })

    vim.keymap.set({ "n", "x" }, "go", function()
      return require("opencode").operator "@this "
    end, { expr = true, desc = "Add range to opencode" })
    vim.keymap.set("n", "goo", function()
      return require("opencode").operator "@this " .. "_"
    end, { expr = true, desc = "Add line to opencode" })

    vim.keymap.set("n", "<S-C-u>", function()
      require("opencode").command "session.half.page.up"
    end, { desc = "opencode half page up" })
    vim.keymap.set("n", "<S-C-d>", function()
      require("opencode").command "session.half.page.down"
    end, { desc = "opencode half page down" })
  end,
}
