return {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("nordic").load {
            transparent = {
                bg = false,
            },
            on_highlight = function(highlights, palette)
                highlights["@markup.strong"] = {
                    fg = palette.yellow.base,
                    bold = true,
                }
                highlights["@markup.italic"] = {
                    fg = palette.magenta.base,
                    italic = true,
                }
            end,
        }
    end,
}
