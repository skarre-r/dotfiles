-- https://github.com/folke/todo-comments.nvim
return {
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = "VeryLazy",
        opts = {
            signs = true,
            keywords = {
                NOTE = { color = "custom" },
                DOCS = { color = "custom" },
            },
            merge_keywords = true,
            highlight = {
                multiline = true,
                comments_only = true,
            },
            colors = {
                custom = { "DiagnosticOk" },
            },
        },
    },
}
