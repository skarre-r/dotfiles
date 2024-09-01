-- https://github.com/loctvl842/monokai-pro.nvim
return {
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    priority = 1000,
    -- dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local monokai = require("monokai-pro")
        monokai.setup({
            terminal_colors = true,
            devicons = true,
            filter = "pro",
            background_clear = {
                "toggleterm",
                "telescope",
                "nvim-tree",
                "oil",
            },
            plugins = {
                bufferline = {
                    underline_selected = false,
                    underline_visible = false,
                },
                indent_blankline = {
                    context_highlight = "pro", -- default | pro
                    context_start_underline = true,
                },
            },
        })
        vim.cmd.colorscheme("monokai-pro") -- or monokai.load()
    end,
}
