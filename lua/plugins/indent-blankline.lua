return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  config = function()
    local hl = vim.api.nvim_get_hl_by_name("Keyword", true)
    vim.api.nvim_set_hl(0, "hl-IblScope", { fg = hl.foreground })

    require("ibl").setup {
      indent = { char = "▏" },
      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
        highlight = "hl-IblScope",
      },
    }
  end,
}
