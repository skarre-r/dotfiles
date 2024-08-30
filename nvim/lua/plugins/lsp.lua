-- https://github.com/VonHeikemen/lsp-zero.nvim
return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = "v4.x",
        lay = true,
        config = false,
    },
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = true,
    },
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        -- event = "InsertEnter",
        event = "VeryLazy",
        opts = {
            suggestion = { enabled = true },
            panel = { enabled = false },
        }
    },
    {
        'hrsh7th/nvim-cmp',
        -- event = 'InsertEnter',
        event = 'VeryLazy',
        dependencies = {
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-buffer' },
            { 'L3MON4D3/LuaSnip' },
            { 'saadparwaiz1/cmp_luasnip' },
            { "zbirenbaum/copilot-cmp" },
        },
        config = function()
            local cmp = require('cmp')

            cmp.setup({
                sources = {
                    { name = 'path' },
                    { name = 'copilot' },
                    { name = 'nvim_lsp' },
                    { name = 'luasnip', keyword_length = 2 },
                    { name = 'buffer',  keyword_length = 3 },
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    -- ['<Enter>'] = cmp.mapping.complete(),
                    ['<CR>'] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = false,
                    })
                }),
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
            })
        end
    },
    {
        'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'hrsh7th/cmp-nvim-lsp' },
        },
        config = function()
            local lsp_zero = require('lsp-zero')

            -- lsp_attach is where you enable features that only work
            -- if there is a language server active in the file
            local lsp_attach = function(client, bufnr)
                lsp_zero.default_keymaps({ buffer = bufnr })
                -- local opts = { buffer = bufnr }
                -- vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
                -- vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
                -- vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
                -- vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
                -- vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
                -- vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
                -- vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
                -- vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
                -- vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
                -- vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
            end

            lsp_zero.extend_lspconfig({
                sign_text = true,
                lsp_attach = lsp_attach,
                float_border = "rounded",
                capabilities = require('cmp_nvim_lsp').default_capabilities()
            })

            require('mason-lspconfig').setup({
                ensure_installed = { "lua_ls", "gopls" },
                handlers = {
                    function(server_name)
                        require('lspconfig')[server_name].setup({})
                    end,
                }
            })
        end
    }
}
