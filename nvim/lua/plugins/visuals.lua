-- DOCS:
-- https://github.com/lewis6991/gitsigns.nvim
-- https://github.com/lukas-reineke/indent-blankline.nvim
return {
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {},
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            indent = {
                char = "│",
                tab_char = "│",
            },
            scope = { show_start = false, show_end = false },
        },
    },
}
