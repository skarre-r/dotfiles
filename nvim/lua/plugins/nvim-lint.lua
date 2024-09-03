-- https://github.com/mfussenegger/nvim-lint
return {
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
}
