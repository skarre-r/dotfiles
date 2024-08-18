-- DOCS:
-- https://github.com/nvim-tree/nvim-tree.lua
return {
    "nvim-tree/nvim-tree.lua",
    version = "1.6.*",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        -- NOTE: toggle file explorer w/ Shift+CMD+e
        { "<S-D-e>", "<CMD>NvimTreeToggle<CR>", mode = { "n", "v", "i" } }
    },
    config = function()
        require("nvim-tree").setup({
            on_attach = "default",
            hijack_cursor = true,
            auto_reload_on_write = true,
            disable_netrw = true,
            hijack_netrw = true,
            hijack_unnamed_buffer_when_opening = true,
            sync_root_with_cwd = true,
            respect_buf_cwd = true,
            view = {
                cursorline = true,
                side = "left",
                number = false,
                relativenumber = false,
                width = 30,
                float = {
                    enable = false,
                },
            },
            git = {
                enable = true,
            },
            update_focused_file = {
                enable = true,
                update_root = {
                    enable = true,
                },
            },
            diagnostics = {
                enable = true,
            },
            renderer = {
                add_trailing = true,
                group_empty = true,
                indent_width = 2,
                -- FIX: these cause error messages :(
                -- hightlight_git = "name",
                -- hightlight_diagnostics = "all",
                -- hightlight_opened_files = "name",
                -- hightlight_modified = "name",
                -- hightlight_hidden = "name",
                indent_markers = {
                    enable = true,
                },
                icons = {
                    web_devicons = {
                        file = {
                            enable = true,
                            color = false,
                        },
                        folder = {
                            enable = true,
                            color = true,
                        },
                    },
                },
            },
        })
    end
}
