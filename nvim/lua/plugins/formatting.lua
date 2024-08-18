-- DOCS:
-- https://github.com/stevearc/conform.nvim
return {
    "stevearc/conform.nvim",
    cmd = "ConformInfo",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "ruff" },
            css = { "prettier" },
            html = { "prettier" },
            json = { "prettier" },
            yaml = { "prettier" },
            markdown = { "prettier" },
            graphql = { "prettier" },
            javascript = { "biome", "prettier", stop_after_first = true },
            typescript = { "biome", "prettier", stop_after_first = true },
            javascriptreact = { "biome", "prettier", stop_after_first = true },
            typescriptreact = { "biome", "prettier", stop_after_first = true },
            go = { "goimports", "gofmt" },
        },
        default_format_opts = {
            timeout_ms = 3000,
            async = false,
            quiet = false,
            lsp_format = "fallback",
        },
        format_on_save = {
            lsp_format = "fallback",
            timeout_ms = 500,
        },
        format_after_save = {
            lsp_format = "fallback"
        },
        notify_on_error = true,
        formatters = {}, -- NOTE: custom formatters
    },
}
