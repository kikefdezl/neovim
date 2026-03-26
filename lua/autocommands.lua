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

-- Enable treesitter highlighting automatically for all supported filetypes
vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
        local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
        if lang then
            pcall(vim.treesitter.start, args.buf, lang)
        end
    end,
})
