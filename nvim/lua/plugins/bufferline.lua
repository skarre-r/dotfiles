-- DOCS:
-- https://github.com/akinsho/bufferline.nvim
return {
    "akinsho/bufferline.nvim",
    version = "*",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        options = {
            mode = "buffers", -- "buffers" | "tabs"
            diagnostics = "nvim_lsp",
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "NvimTree_1", -- or function
                    text_align = "left", -- "left" | "center" | "right"
                    separator = true,
                },
            },
            color_icons = true,
            show_buffer_icons = true,
            show_buffer_close_icons = true,
            show_close_icon = true,
            show_tab_indicators = true,
            separator_style = "thin", -- "slant" | "slope" | "thick" | "thin"
            always_show_bufferline = true,
            auto_toggle_bufferline = true,
            hover = {
                enabled = true,
            },
        },
    },
}
