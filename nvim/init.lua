-------------------------------------------------------------------------------
-- Options
-------------------------------------------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.breakindent = true
vim.opt.list = true -- show invisible characters
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.showmode = true
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.hlsearch = true

-------------------------------------------------------------------------------
-- Keymap
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Lazy.nvim
-------------------------------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable", -- latest stable release
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-------------------------------------------------------------------------------
-- Plugins
-------------------------------------------------------------------------------
require("lazy").setup({
    { -- https://github.com/loctvl842/monokai-pro.nvim
        "loctvl842/monokai-pro.nvim",
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        config = function()
            local monokai = require("monokai-pro")
            monokai.setup({
                terminal_colors = true,
                devicons = true,
                filter = "pro",
                background_clear = {
                    "telescope",
                    "notify",
                    "neo-tree"
                }
            })
            monokai.load() -- or `vim.cmd.colorscheme("monokai-pro")`
        end,
        lazy = false,
    },
    { -- https://github.com/nvim-neo-tree/neo-tree.nvim
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        keys = {
            { "<leader>e", "<CMD>Neotree focus<CR>", mode = "n" }
        },
        opts = {
            close_if_last_window = true,
            filesystem = {
                filtered_items = {
                    visible = true
                },
                follow_current_file = {
                    enabled = true
                },
                hijack_netrw_behavior = "open_default", -- "open_default" | "open_current" | "disabled",
                use_libuv_file_watcher = true
            },
            buffers = {
                follow_current_file = {
                    enabled = true
                }
            }
        }
    },
    { -- https://github.com/folke/noice.nvim
        "folke/noice.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        opts = {
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            }
        },
    },
    { -- https://github.com/nvim-telescope/telescope.nvim
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        keys = {
            { "<leader>ff", "<CMD>Telescope find_files<CR>", mode = { "n", "i", "v" } }
        },
        opts = {}
    },
    { -- https://github.com/VonHeikemen/lsp-zero.nvim/
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v4.x',
        dependencies = {
            'neovim/nvim-lspconfig',
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/nvim-cmp',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
        },
        config = function()
            local cmp = require("cmp")
            local cmp_lsp = require("cmp_nvim_lsp")
            local capabilities = vim.tbl_deep_extend(
                "force",
                {},
                vim.lsp.protocol.make_client_capabilities(),
                cmp_lsp.default_capabilities()
            )

            local lsp_zero = require("lsp-zero")
            local lsp_attach = function(client, bufnr)
                -- todo keymaps?
                lsp_zero.default_keymaps({ buffer = bufnr })
            end
            lsp_zero.extend_lspconfig({
                sign_text = true,
                lsp_attach = lsp_attach,
                float_border = "rounded",
                capabilities = capabilities
            })

            require('mason').setup({})
            require('mason-lspconfig').setup({
                ensure_installed = { 'lua_ls', 'gopls' },
                handlers = {
                    -- "default handler": used by language servers without their own handler
                    function(server_name)
                        require('lspconfig')[server_name].setup({
                            capabilities = capabilities
                        })
                    end,
                    -- example: lua language server handler
                    ["lua_ls"] = function()
                        require("lspconfig").lua_ls.setup({
                            capabilities = capabilities,
                            on_init = function(client)
                                lsp_zero.nvim_lua_settings(client, {})
                            end,
                            settings = {
                                Lua = {
                                    diagnostics = {
                                        globals = { "vim" }
                                    }
                                }
                            }
                        })
                    end
                },
            })
            cmp.setup({
                sources = {
                    { name = "path" },
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                },
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end
                },
                mapping = cmp.mapping.preset.insert({}),
                formatting = lsp_zero.cmp_format({ details = true })
            })
        end
    },
    { -- https://github.com/nvim-treesitter/nvim-treesitter
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
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
                    "python"
                },
                highlight = { enable = true },
            })
        end
    },
})
