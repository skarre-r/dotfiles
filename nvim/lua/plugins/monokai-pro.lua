-- https://github.com/loctvl842/monokai-pro.nvim
return {
    "loctvl842/monokai-pro.nvim",
    config = function()
        local monokai = require("monokai-pro")
        monokai.setup({
            terminal_colors = true,
            devicons = true,
            filter = "pro",
            background_clear = {
                "toggleterm",
                "telescope",
                "which-key",
                "notify",
                "nvim-tree",
                "neo-tree",
                "bufferline"
            }
        })
        monokai.load() -- important
    end
}
