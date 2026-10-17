--- NORDIC ---
--
-- vim.pack.add { "https://github.com/AlexvZyl/nordic.nvim" }
--
-- require("nordic").load {
--     transparent = {
--         bg = false,
--     },
--     on_palette = function(_) end,
--     after_palette = function(_) end,
--     on_highlight = function(highlights, palette)
--         highlights["@markup.strong"] = {
--             fg = palette.yellow.base,
--             bold = true,
--         }
--         highlights["@markup.italic"] = {
--             fg = palette.magenta.base,
--             italic = true,
--         }
--     end,
-- }
--
-- vim.cmd.colorscheme "nordic"

--- ROSE PINE ---

vim.pack.add {
    {
        src = "https://github.com/rose-pine/neovim",
        name = "rose-pine",
    },
}
require("rose-pine").setup()
vim.cmd "colorscheme rose-pine"

--- LOVELACE ---

-- vim.pack.add {
--     {
--         src = "https://github.com/yamazakiji/lovelace.nvim.git",
--         name = "lovelace",
--     },
-- }
-- require("lovelace").setup()
-- vim.cmd "colorscheme lovelace"
