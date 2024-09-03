vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("custom-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("custom-inlay-hints", { clear = true }),
    callback = function()
        if vim.lsp.inlay_hint then
            vim.lsp.inlay_hint.enable(true, { 0 })
        end
    end,
})
