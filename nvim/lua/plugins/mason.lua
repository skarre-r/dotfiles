-- DOCS:
-- https://github.com/williamboman/mason.nvim
-- https://github.com/williamboman/mason-lspconfig.nvim
-- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
return {
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        build = ":MasonUpdate",
        event = "VeryLazy",
        opts = {}
    },
    {
        "williamboman/mason-lspconfig.nvim",
        event = "VeryLazy",
        opts = {}
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        event = "VeryLazy",
        opts = {
            ensure_installed = {
                "ruff",
                "biome",
                "stylua",
                "prettier",
                "eslint_d",
                "goimports",
                "golangci-lint",
            },
            auto_update = true,
            run_on_start = true,
        }
    }
}
