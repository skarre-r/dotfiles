-- https://github.com/nvim-treesitter/nvim-treesitter
-- https://github.com/nvim-treesitter/nvim-treesitter-context
-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
return {
    {
        'nvim-treesitter/nvim-treesitter',
        version = false,
        build = ':TSUpdate',
        event = { "VeryLazy" },      -- ???
        lazy = vim.fn.argc(-1) == 0, -- ???
        init = function(plugin)      -- ???
            require("lazy.core.loader").add_to_rtp(plugin)
            require("nvim-treesitter.query_predicates")
        end,
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "lua",
                    "luadoc",
                    "vim",
                    "vimdoc",
                    "query",
                    "regex",
                    "markdown",
                    "markdown_inline",
                    "go",
                    "bash",
                    "python"
                },
                sync_install = false,
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
        dependencies = {
            'nvim-treesitter/nvim-treesitter-context',
            'nvim-treesitter/nvim-treesitter-textobjects',
        }
    },
}
