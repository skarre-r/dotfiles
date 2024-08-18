-- DOCS:
-- https://github.com/nvim-treesitter/nvim-treesitter
-- https://github.com/nvim-treesitter/nvim-treesitter-context
-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
-- https://github.com/windwp/nvim-ts-autotag
return {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    lazy = vim.fn.argc(-1) == 0, -- NOTE: don't lazy load when opening a file from command line
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        { "nvim-treesitter/nvim-treesitter-context", opts = { enable = true, mode = "cursor" } },
        "windwp/nvim-ts-autotag",
    },
    init = function(plugin)
        require("lazy.core.loader").add_to_rtp(plugin)
        require("nvim-treesitter.query_predicates")
    end,
    config = function()
        require("nvim-treesitter.configs").setup({
            modules = {},
            ignore_install = {},
            auto_install = false,
            sync_install = true,
            highlight = { enable = true },
            indent = { enable = true },
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
                "python",
            },
            textobjects = {
                move = {
                    enable = true
                }
            }
        })
    end,
}
