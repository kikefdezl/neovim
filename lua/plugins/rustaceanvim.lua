-- NOTE: rustaceanvim sets up LSP for us, so don't configure it
-- via nvim-lspconfig as it may cause conflicts.
-- Also, it just happens to magically interface with nvim-dap as
-- long as codelldb is installed.

return {
  "mrcjkb/rustaceanvim",
  dependencies = {
    "mfussenegger/nvim-dap",
  },
  version = "^6",
  lazy = false, -- This plugin is already lazy
  ft = "rust",

  -- NOTE: Requires `rust_analyzer` but the rustup installed one is enough
  -- so don't install via Mason or you get double diagnostics

  config = function()
    return {
      -- TODO: requires `codelldb`, ensure installed with Mason
      dap = {},
    }
  end,
}
