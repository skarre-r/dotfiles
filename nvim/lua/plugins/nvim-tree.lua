return {
    'nvim-tree/nvim-tree.lua',
    enabled = false, -- todo
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    opts = {
        renderer = {
            icons = {
                web_devicons = {
                    file = {
                        color = false
                    }
                },
            }
        }
    }
}
