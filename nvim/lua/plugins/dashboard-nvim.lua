-- https://github.com/nvimdev/dashboard-nvim
return {
    "nvimdev/dashboard-nvim",
    enabled = false, -- todo
    event = "VimEnter",
    lazy = false,
    opts = {
        theme = "hyper"
    },
    dependencies = { 'nvim-tree/nvim-web-devicons' }
}
