-- DOCS:
-- https://github.com/folke/todo-comments.nvim
-- https://github.com/folke/ts-comments.nvim
return {
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            signs = true,
            keywords = {
                DOCS = { color = "hint" }
            },
            merge_keywords = true,
            highlight = {
                multiline = true,
                comments_only = true
            }
        }
    },
    {
        "folke/ts-comments.nvim",
        event = "InsertEnter",
        opts = {},
    },
}
