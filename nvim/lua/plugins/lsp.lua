-- DOCS:
-- https://github.com/neovim/nvim-lspconfig
return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        local lspconfig = require('lspconfig')
        lspconfig.util.default_config.capabilities = vim.tbl_deep_extend(
            'force',
            lspconfig.util.default_config.capabilities,
            require('cmp_nvim_lsp').default_capabilities()
        )

        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls", "gopls", "basedpyright", "pyright" },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup({})
                end,
                ["lua_ls"] = function()
                    require("lspconfig").lua_ls.setup({
                        settings = {
                            Lua = {
                                hint = {
                                    enable = true,
                                },
                            },
                        },
                    })
                end,
                ["gopls"] = function()
                    require("lspconfig").gopls.setup({
                        settings = {
                            gopls = {
                                ["ui.inlayhint.hints"] = {
                                    rangeVariableTypes = false,
                                    parameterNames = true,
                                    constantValues = true,
                                    assignVariableTypes = true,
                                    compositeLiteralFields = true,
                                    compositeLiteralTypes = true,
                                    functionTypeParameters = true,
                                },
                            },
                        },
                    })
                end,
            }
        })
    end
}
