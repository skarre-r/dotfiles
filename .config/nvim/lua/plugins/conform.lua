-- https://github.com/stevearc/conform.nvim
return {
    "stevearc/conform.nvim",
    lazy = true,
    event = "VeryLazy",
    cmd = "ConformInfo",
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "ruff" },
            go = { "gofmt", "goimports" },
            yaml = { "prettierd", "prettier", stop_after_first = true },
            json = { "prettierd", "prettier", stop_after_first = true },
        },
        default_format_opts = {
            timeout_ts = 3000,
            async = false,
            quiet = false,
            lsp_format = "fallback"
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback"
        },
        format_after_save = {
            lsp_format = "fallback"
        }
    }
}
