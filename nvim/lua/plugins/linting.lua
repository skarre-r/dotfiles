-- DOCS:
-- https://github.com/mfussenegger/nvim-lint
return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lint = require("lint")
        lint.linters_by_ft = {
            go = { "golangcilint" },
            python = { "ruff" },
            javascript = { "biome", "eslint_d" },
            typescript = { "biome", "eslint_d" },
            javascriptreact = { "biome", "eslint_d" },
            typescriptreact = { "biome", "eslint_d" },
        }
        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
            callback = function()
                lint.try_lint()
            end,
        })
    end,
}
