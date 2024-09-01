-- https://github.com/mfussenegger/nvim-lint
-- https://github.com/stevearc/conform.nvim
return {
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
            },
            auto_update = true,
            run_on_start = true
        }
    },
    {
        "mfussenegger/nvim-lint",
        lazy = true,
        event = "VeryLazy",
        config = function()
            local nvim_lint = require("lint")
            nvim_lint.linters_by_ft = {
                go = { "golangci-lint" },
                python = { "ruff" },
                yaml = { "yamllint" },
                json = { "jsonlint" }
            }
            vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
                group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
                callback = function()
                    nvim_lint.try_lint()
                end
            })
        end
    },
    {
        "stevearc/conform.nvim",
        lazy = true,
        event = "VeryLazy",
        cmd = "ConformInfo",
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "ruff" },
                yaml = { "prettier" },
                json = { "prettier" },
                go = { "gofmt", "goimports" },
            },
        }
    },
}
