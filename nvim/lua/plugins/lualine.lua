-- NOTE: https://github.com/nvim-lualine/lualine.nvim
-- TODO: extend config
return {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        options = {
            icons_enabled = true,
            theme = "auto", -- or "monokai-pro"
        },
    },
}
