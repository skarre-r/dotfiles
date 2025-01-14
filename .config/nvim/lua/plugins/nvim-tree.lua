-- https://github.com/nvim-tree/nvim-tree.lua
return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    keys = {
        { "<S-D-e>", "<CMD>NvimTreeToggle<CR>", mode = "n" },
        {
            "<D-e>",
            function()
                if vim.fn.bufname():match("NvimTree_") then
                    vim.cmd.wincmd("p")
                else
                    vim.cmd("NvimTreeFindFile")
                end
            end,
            mode = "n",
        },
    },
    config = function()
        local function on_attach_fn(bufnr)
            local api = require("nvim-tree.api")

            local function opts(desc)
                return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end

            api.config.mappings.default_on_attach(bufnr)
            vim.keymap.set('n', '<Right>', function()
                local node = api.tree.get_node_under_cursor()
                if node.nodes then
                    if not node.open then
                        api.node.open.edit()
                    else
                        vim.cmd(":normal 1j")
                    end
                end
            end, opts('Open folder'))

            vim.keymap.set('n', '<Left>', function()
                local node = api.tree.get_node_under_cursor()
                if node.nodes then
                    if node.open then
                        api.node.open.edit()
                    else
                        api.node.navigate.parent()
                    end
                else
                    api.node.navigate.parent()
                end
            end, opts('Close folder'))

            vim.keymap.set("n", "<Up>", function()
                vim.cmd(":normal 1k")
                local node = api.tree.get_node_under_cursor()
                if not node.nodes then
                    api.node.open.preview()
                end
            end, opts("Move up"))

            vim.keymap.set("n", "<Down>", function()
                vim.cmd(":normal 1j")
                local node = api.tree.get_node_under_cursor()
                if not node.nodes then
                    api.node.open.preview()
                end
            end, opts("Move down"))

            vim.keymap.set("n", "n", function()
                local node = api.tree.get_node_under_cursor()
                api.fs.create(node)
            end, opts("Create file"))
        end

        require("nvim-tree").setup({
            on_attach = on_attach_fn, -- "default"
            hijack_cursor = true,
            auto_reload_on_write = true,
            disable_netrw = true,
            hijack_netrw = true,
            hijack_unnamed_buffer_when_opening = false,
            sync_root_with_cwd = true,
            respect_buf_cwd = true,
            view = {
                cursorline = true,
                side = "left",
                number = false,
                relativenumber = false,
                width = 30,
                float = { enable = false },
            },
            git = { enable = true },
            update_focused_file = {
                enable = true,
                update_root = { enable = true },
            },
            diagnostics = { enable = true },
            renderer = {
                add_trailing = true,
                group_empty = true,
                indent_width = 2,
                -- "name" / "icon" / "all" / "none"
                highlight_git = "name",
                highlight_diagnostics = "name",
                highlight_opened_files = "name",
                highlight_modified = "name",
                highlight_hidden = "name",
                indent_markers = { enable = true },
            },
        })
    end,
}
