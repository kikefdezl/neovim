vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- disable expand tab on Makefiles
vim.api.nvim_create_autocmd("FileType", {
  pattern = "make",
  command = "setlocal noexpandtab tabstop=8 shiftwidth=8",
})


