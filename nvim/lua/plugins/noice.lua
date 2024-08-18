-- DOCS:
-- https://github.com/folke/noice.nvim
return {
    {
        "folke/noice.nvim",
        version = "4.4.7", -- NOTE: 4.5.0 is broken, unlock version when it's fixed
        dependencies = {
            "MunifTanjim/nui.nvim",
            { "rcarriga/nvim-notify", opts = { stages = "static", timeout = 3000 } }
        },
        event = "VeryLazy",
        opts = {
            cmdline = {
                enabled = true,
                view = "cmdline_popup", -- "cmdline" | "cmdline_popup",
                opts = {},
            },
            messages = {
                enabled = true,
            },
            popupmenu = {
                enabled = true,
                backend = "nui",
            },
            notify = {
                enabled = true,
                view = "notify",
            },
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
                hover = { enabled = true },
                signature = {
                    enabled = true,
                    auto_open = { enabled = true, trigger = true, luasnip = true },
                    opts = {},
                },
                message = {
                    enabled = true,
                    view = "notify",
                    opts = {},
                },
                documentation = {
                    view = "hover",
                },
            },
            -- docs: https://github.com/folke/noice.nvim/blob/main/lua/noice/config/views.lua
            views = {
                hover = {
                    border = {
                        style = "rounded",
                    },
                    position = { row = 2, col = 2 },
                },
                cmdline_popup = {
                    position = {
                        row = 3,
                        col = "50%",
                    },
                    size = {
                        min_width = 60,
                        width = "auto",
                        height = "auto",
                    },
                },
                cmdline_popupmenu = {
                    relative = "editor",
                    position = {
                        row = 6,
                        col = "50%",
                    },
                    size = {
                        width = 60,
                        height = "auto",
                        max_height = 33,
                    },
                    border = {
                        style = "rounded",
                        padding = { 0, 1 },
                    },
                    win_options = {
                        winhighlight = { Normal = "Normal", FloatBorder = "NoiceCmdlinePopupBorder" },
                    },
                },
            },
        }
    },
}
