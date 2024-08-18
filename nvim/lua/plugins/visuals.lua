-- DOCS:
-- https://github.com/lewis6991/gitsigns.nvim
-- https://github.com/lukas-reineke/indent-blankline.nvim
return {
    {
        "lewis6991/gitsigns.nvim",
        event = "BufEnter",
        opts = {},
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        event = "BufEnter",
        opts = {
            indent = {
                char = "│",
                tab_char = "│",
            },
            scope = { show_start = false, show_end = false },
        },
    },
}
