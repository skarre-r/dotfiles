return { -- https://github.com/loctvl842/monokai-pro.nvim
    'loctvl842/monokai-pro.nvim',
    config = function()
        local monokai = require("monokai-pro")
        monokai.setup({
            filter = "pro"
        })
        monokai.load()
    end
}
