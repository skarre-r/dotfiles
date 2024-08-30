-- https://github.com/echasnovski/mini.nvim
return {
    {
        'echasnovski/mini.notify',
        version = '*',
        event = "VeryLazy",
        opts = {}
    },
    {
        "echasnovski/mini.icons",
        version = "*",
        lazy = true,
        specs = {
            { "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
        },
        init = function()
            package.preload["nvim-web-devicons"] = function()
                require("mini.icons").mock_nvim_web_devicons()
                return package.loaded["nvim-web-devicons"]
            end
        end,
        opts = {},
    },
    {
        'echasnovski/mini.tabline',
        version = '*',
        lazy = false,
        opts = {
            show_icons = false
        }
    },
    {
        'echasnovski/mini.statusline',
        version = '*',
        event = "VeryLazy",
        config = function()
            require("mini.statusline").setup({ set_vim_settings = false })

            vim.api.nvim_set_hl(0, "MiniStatuslineModeNormal", { bg = "#ffd866", fg = "#221f22" })
            vim.api.nvim_set_hl(0, "MiniStatuslineModeInsert", { bg = "#a9dc76", fg = "#221f22" })
            vim.api.nvim_set_hl(0, "MiniStatuslineModeVisual", { bg = "#ab9df2", fg = "#221f22" })
            vim.api.nvim_set_hl(0, "MiniStatuslineModeReplace", { bg = "#ff6188", fg = "#221f22" })
            vim.api.nvim_set_hl(0, "MiniStatuslineModeCommand", { bg = "#ffd866", fg = "#221f22" })
            -- vim.api.nvim_set_hl(0, "MiniStatuslineModeOther", { bg = "", fg = "" })
            -- vim.api.nvim_set_hl(0, "MiniStatuslineInactive", { bg = "#221f22", fg = "#ffd866" })
            vim.api.nvim_set_hl(0, "MiniStatuslineDevinfo", { bg = "#19181a", fg = "#727072" })
            vim.api.nvim_set_hl(0, "MiniStatuslineFilename", { bg = "#19181a", fg = "#727072" })
            vim.api.nvim_set_hl(0, "MiniStatuslineFileinfo", { bg = "#19181a", fg = "#727072" })
        end
    },
    {
        'echasnovski/mini.indentscope',
        version = '*',
        event = "VeryLazy",
        config = function()
            local indentscope = require("mini.indentscope")
            indentscope.setup({
                symbol = "|",
                draw = {
                    delay = 16,
                    animation = indentscope.gen_animation.none()
                },
            })
            vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#5b595c" })
        end,
    },
}
