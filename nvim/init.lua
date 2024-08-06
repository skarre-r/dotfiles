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
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
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
                            unstaged = "x"
                        }
                    }
                }
            }
        }
    }
})
