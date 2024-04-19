local null_ls = require "null-ls"

local opts = {
  sources = {
    null_ls.builtins.formatting.prettier.with { filetypes = { "html", "css", "yaml", "json" } },
  }
}

return opts
