-- https://github.com/nvim-neo-tree/neo-tree.nvim
--[[
TODO:
    - dont close sidebar when opening file
    - kill nvim if :q with no buffer (not only sidebar)
-- ]]
return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    opts = {
        close_if_last_window = false, -- todo
        popup_border_style = "rounded",
        enable_git_status = true,
        filesystem = {
            filtered_items = {
                visible = true
            },
            hijack_netrw_behavior = 'open_default' -- "open_current"
        }
    },
}
