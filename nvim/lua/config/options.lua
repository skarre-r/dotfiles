vim.g.mapleader          = " "
vim.g.maplocalleader     = " "
vim.g.have_nerd_font     = true
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.undofile         = true
vim.opt.backup           = false
vim.opt.writebackup      = false
vim.opt.mouse            = "a"
vim.opt.breakindent      = true
vim.opt.cursorline       = true
vim.opt.linebreak        = true
vim.opt.number           = true
vim.opt.splitright       = true
vim.opt.splitbelow       = true
vim.opt.ruler            = false
vim.opt.showmode         = false
vim.opt.wrap             = false
vim.opt.signcolumn       = "yes"
vim.opt.fillchars        = "eob: "
vim.opt.ignorecase       = true
vim.opt.incsearch        = true
vim.opt.infercase        = true
vim.opt.smartcase        = true
vim.opt.smartindent      = true
vim.opt.completeopt      = 'menuone,noinsert,noselect'
vim.opt.virtualedit      = "onemore"

vim.opt.termguicolors    = true
vim.opt.updatetime       = 250
vim.opt.timeoutlen       = 300
vim.opt.list             = true --  show invisible characters
vim.opt.listchars        = { tab = ">  ", trail = "-", nbsp = "+" }
vim.opt.inccommand       = "split"
vim.opt.scrolloff        = 10
vim.opt.shiftwidth       = 4
vim.opt.tabstop          = 4
vim.opt.hlsearch         = true
vim.wo.wrap              = false

vim.schedule(function()
    vim.opt.clipboard = "unnamedplus"
end)
