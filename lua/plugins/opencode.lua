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

    -- Your existing keymaps
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

    -- Notification on Opencode finishing
    vim.api.nvim_create_autocmd("User", {
      pattern = { "OpencodeEvent", "OpencodeEvent:*" },
      callback = function(args)
        local event = args.data and args.data.event
        if not event then
          return
        end

        -- session.idle is the event type that indicates opencode has finished responding
        if event.type == "session.idle" then
          vim.notify("Opencode session is idle", vim.log.levels.INFO, { title = "opencode" })

          if vim.fn.executable "notify-send" == 1 then
            vim.fn.jobstart({
              "notify-send",
              "-a",
              "neovim-opencode",
              "-u",
              "low",
              "Opencode Done!",
            }, { detach = true })
          end
        end
      end,
      desc = "Send system notification when Opencode finishes processing",
    })
  end,
}
