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
        opts = {
            ensure_installed = { "lua", "vim", "vimdoc" },
            sync_install = false,
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        }
        -- config = function()
        --     require("nvim-treesitter.configs").setup({
        --         ensure_installed = { "lua", "vim", "vimdoc" },
        --         sync_install = false,
        --         auto_install = true,
        --         highlight = { enable = true },
        --         indent = { enable = true },
        --     })
        -- end
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'j-hui/fidget.nvim'
        },
        config = function()
            -- todo
            require("mason").setup()
            require("mason-lspconfig").setup({})
        end
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
    }
})
