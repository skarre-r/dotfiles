-- https://github.com/akinsho/toggleterm.nvim
return {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
        { "<D-j>",   "<CMD>ToggleTerm<CR>", mode = { "n", "v", "i", "t" } },
        -- { "<S-D-j>", "<CMD>ToggleTerm<CR>", mode = { "n", "v", "i", "t" } },
    },
    event = "VeryLazy",
    opts = {
        size = 25,
        hide_numbers = true,
        autochdir = false,
        start_in_insert = true,
        -- TODO: insert vs terminal mappings :thinking:
        insert_mappings = true,
        terminal_mapping = true,
        persist_mode = false,
        direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float',
        auto_scroll = true,
        float_opts = {
            border = "curved",
        },
    },
}
