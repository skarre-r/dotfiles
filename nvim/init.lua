-- global
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true
vim.g.loaded_netrw = 1 -- disable the default file explorer
vim.g.loaded_netrwPlugin = 1


-- options
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.showmode = false
vim.opt.clipboard = 'unnamedplus'
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.updatetime = 250
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.hlsearch = true


-- keymap
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })


-- lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)


-- plugins
require('lazy').setup({
    checker = { enabled = true },
    {
        'lewis6991/gitsigns.nvim',
        opts = {}
    },
    { -- todo telescope/ trouble integrations: https://github.com/folke/todo-comments.nvim
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {}
    },
    {
        "folke/which-key.nvim",
        enabled = false, -- todo
        opts = {}
    },
    {
        "folke/trouble.nvim",
        enabled = false, -- todo
        opts = {}
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {}
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "lua", "luadoc", "vim", "vimdoc", "markdown" },
                sync_install = false,
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/nvim-cmp',
            'L3MON4D3/LuaSnip',         -- todo
            'saadparwaiz1/cmp_luasnip', -- todo
            'j-hui/fidget.nvim'
        },
        config = function()
            -- cmp = completion
            local cmp = require("cmp")
            local cmp_lsp = require("cmp_nvim_lsp")
            local capabilities = vim.tbl_deep_extend(
                "force",
                {},
                vim.lsp.protocol.make_client_capabilities(),
                cmp_lsp.default_capabilities())

            -- todo
            require("fidget").setup({})

            -- mason: installs lsps
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls", "gopls"
                },
                handlers = {
                    function(server_name)
                        require("lspconfig")[server_name].setup {
                            capabilities = capabilities
                        }
                    end,
                    ["lua_ls"] = function()
                        local lspconfig = require("lspconfig")
                        lspconfig.lua_ls.setup {
                            capabilities = capabilities,
                            settings = {
                                Lua = {
                                    runtime = { version = "Lua 5.4" },
                                    diagnostics = {
                                        globals = { "vim" }
                                    }
                                }
                            }
                        }
                    end
                }
            })
            -- todo what does this do
            local cmp_select = { behavior = cmp.SelectBehavior.Select }
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_extend(args.body) -- luasnip
                    end
                },
                mapping = cmp.mapping.preset.insert({ -- todo
                    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                }, {
                    { name = "buffer" },
                })
            })
            vim.diagnostic.config({
                -- update_in_insert = true,
                float = {
                    focusable = false,
                    style = "minimal",
                    border = "rounded",
                    source = "always",
                    header = "",
                    prefix = "",
                },
            })
        end
    },
    {
        'L3MON4D3/LuaSnip',
        version = "v2.*",
        dependencies = { "rafamadriz/friendly-snippets" },
        opts = {}
    },
    {
        'loctvl842/monokai-pro.nvim',
        config = function()
            local monokai = require("monokai-pro")
            monokai.setup({
                terminal_colors = true,
                devicons = true,
                filter = "pro",
                background_clear = {
                    "toggleterm",
                    "telescope",
                    "nvim-tree",
                }
            })
            monokai.load() -- important
        end
    },
    {
        'nvim-tree/nvim-web-devicons',
        opts = {}
    },
    {
        'nvim-tree/nvim-tree.lua', -- todo neo-tree?
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        opts = {
            renderer = {
                icons = {
                    web_devicons = {
                        file = {
                            color = false
                        }
                    },
                    glyphs = {
                        git = {
                            unstaged = "x" -- todo
                        }
                    }
                }
            }
        }
    },
    {
        'nvim-lualine/lualine.nvim',
        enabled = false, --todo
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        opts = {}
    },
    {
        "ThePrimeagen/harpoon",
        enabled = false, -- todo
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {}
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        enabled = false, -- todo
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim",
        },
        opts = {}
    },
    { -- https://github.com/lewis6991/hover.nvim
        "lewis6991/hover.nvim",
        config = function()
            require("hover").setup({
                init = function()
                    require("hover.providers.lsp")
                end,
                preview_opts = {
                    border = "single"
                },
                preview_window = false,
                title = true,
                mouse_providers = { "LSP" },
                mouse_delay = 500
            })
            -- Mouse support
            vim.keymap.set('n', '<MouseMove>', require('hover').hover_mouse, { desc = "hover.nvim (mouse)" })
            vim.o.mousemoveevent = true
        end
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify", -- optional, fallback = 'mini'
        },
        opts = {
            lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
                },
            },
            -- you can enable a preset for easier configuration
            presets = {
                bottom_search = true,         -- use a classic bottom cmdline for search
                command_palette = true,       -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = false,           -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = false,       -- add a border to hover docs and signature help
            },
        },
    }
})
