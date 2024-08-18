-- TODO:
-- fix nvim-tree (error) message(s)
-- improve lazy loading: https://lazy.folke.io/spec/lazy_loading
-- customize "cmp" window(s)?

-- TODO:
-- lsp code actions (quick fixes)
-- nvim-tree: use left/ right to open/ close directories
-- copilot
-- nvim-cmp: more mappings: https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings
-- learn how "tabs" work
-- find more plugins: https://dotfyle.com/neovim/plugins/top
-- telescope extensions? https://github.com/nvim-telescope/telescope.nvim/wiki/Extensions
-- telescope find_files: include hidden files
-- telescope find_files: no selection vs selection
-- steal lazyvim keymaps? http://www.lazyvim.org/keymaps
-- what does "noremap" do ???
-- telescope recipes: https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes
-- nvim-tree: ignore help pages, etc ???
-- telescope: git_x: change enter behaviour
-- extend todo-comments config
-- telescope git commits: show remote (pushed/ not pushed)
-- cmdline/ cmd: space > show options window
-- startup screen plugin
-- debug adapter(s)?


------------------------------------------------------------------------------
-- Options
-------------------------------------------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.breakindent = true
vim.opt.list = true -- show invisible characters
vim.opt.listchars = { tab = ">  ", trail = "-", nbsp = "+" }
vim.opt.showmode = true
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.updatetime = 250
vim.opt.hlsearch = true
vim.opt.undofile = true

-------------------------------------------------------------------------------
-- Keymap
-------------------------------------------------------------------------------
vim.keymap.set({ "n" }, "<Esc>", "<CMD>nohlsearch<CR>", { silent = true, desc = "Exit search" })
vim.keymap.set({ "n", "v" }, "<D-f>", "/", { desc = "Search (CMD+f)" })
vim.keymap.set({ "n" }, "<S-D-p>", ":", { desc = "Open cmdline (Shift+CMD+p)" })
vim.keymap.set({ "n" }, "<A-Left>", "b", { silent = true, desc = "Move cursor left (Option+Left)" })                    -- TODO: doesn't work
vim.keymap.set({ "n" }, "<A-Right>", "w", { silent = true, noremap = true, desc = "Move cursor right (Option+Right)" }) -- TODO: doesn't work
vim.keymap.set({ "n" }, "<A-Up>", ":m .-2<CR>==", { silent = true, desc = "Move line up (Option+Up)" })
vim.keymap.set({ "n" }, "<A-Down>", ":m .+1<CR>==", { silent = true, desc = "Move line down (Option+Down)" })
vim.keymap.set({ "v" }, "<A-Up>", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move line up (Option+Up)" })
vim.keymap.set({ "v" }, "<A-Down>", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move line down (Option+Down)" })
vim.keymap.set({ "n" }, "<D-w>", "<CMD>q<CR>", { silent = true, desc = "Close buffer (CMD+w)" })
vim.keymap.set({ "n" }, "<S-D-w>", "<CMD>q!<CR>", { silent = true, desc = "Force close buffer (Shift+CMD+w)" })
vim.keymap.set({ "i" }, "<A-BS>", "<C-W>", { silent = true, noremap = true, desc = "Delete word (Option+Backspace)" })
vim.keymap.set({ "n", "v", "i" }, "<D-s>", "<CMD>w<CR><Esc>", { silent = true, desc = "Save buffer (CMD+s)" }) -- NOTE: exists to normal mode
vim.keymap.set({ "n", "v", "i" }, "<D-z>", "<CMD>undo<CR>", { silent = true, desc = "Undo (CMD+Z)" })
vim.keymap.set({ "n", "v", "i" }, "<S-D-z>", "<CMD>redo<CR>", { silent = true, desc = "Redo (Shift+CMD+z)" })

-- TODO:
-- ALT+left (word left)
-- ALT+right (word right)
-- CMD+left (start of line)
-- CMD+right (end of line)
-- CMD+up (start of file)
-- CMD+down (end of file)
-- ALT+delete (delete word right)
-- CMD+backspace (delete line left)
-- CMD+delete (delete line right)
-- SHIFT+up (select line up) TODO: set to jump x lines up — visual mode
-- SHIFT+down (select line down) TODO: set to jump x lines down — visual mode
-- CTRL+CMD+right (split (and move) right)
-- CTRL+CMD+left (split (and move) left)
-- CMD-k > CMD+c (toggle line/ selection comment)
-- CMD+d (select matching selection)
-- CMD+click (go to definition)
-- <leader>jk > exit insert mode

-------------------------------------------------------------------------------
-- Autocommands
-------------------------------------------------------------------------------
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("custom-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("custom-inlay-hints", { clear = true }),
    callback = function()
        if vim.lsp.inlay_hint then
            vim.lsp.inlay_hint.enable(true, { 0 })
        end
    end,
})

-------------------------------------------------------------------------------
-- Lazy.nvim: https://lazy.folke.io/configuration
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

require("lazy").setup({
    spec = { import = "plugins" },
    defaults = { lazy = true },
    install = { missing = true },
    checker = { enabled = true, notify = true, frequency = 3600 },
    change_detection = { enabled = true, notify = false },
    performance = {
        cache = { enabled = true },
        reset_packpath = true,
        rtp = {
            reset = true,
            disabled_plugins = {
                "netrwPlugin"
            }
        }
    },
})
