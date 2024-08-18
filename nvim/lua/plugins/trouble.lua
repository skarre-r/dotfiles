-- DOCS:
-- https://github.com/folke/trouble.nvim
-- TODO: extend config
return {
    "folke/trouble.nvim",
    cmd = { "Trouble" },
    keys = {
        { "<leader>xx",   "<CMD>Trouble diagnostics toggle<CR>", mode = { "n" } },
        { "<leader>todo", "<CMD>Trouble todo toggle<CR>",        mode = { "n" } },
    },
    opts = {
        modes = {
            lsp = { win = { position = "right" } },
        },
    },
}
