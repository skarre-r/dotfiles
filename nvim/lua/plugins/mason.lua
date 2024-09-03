return {
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = true,
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        lazy = true,
        event = "VeryLazy",
        cmd = {
            "MasonToolsInstall",
            "MasonToolsInstallSync",
            "MasonToolsUpdate",
            "MasonToolsUpdateSync",
            "MasonToolsClean",
        },
        opts = {
            ensure_installed = {
                -- linters
                "biome",
                "golangci-lint",
                "jsonlint",
                "luacheck",
                "markdownlint",
                "ruff",
                "shellcheck",
                "yamllint",
                -- formatters
                "goimports",
                "stylua",
                "prettier",
                "prettierd",
            },
            auto_update = true,
            run_on_start = true
        }
    },
}
