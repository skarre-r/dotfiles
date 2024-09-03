-- TODO:
-- CMD+delete (delete line right)
-- CMD-k > CMD+c (toggle line/ selection comment)
-- CMD+click (go to definition) :thinking:
-- CMD+. (code action/ quick fix/ completion?)
-- CMD+k > CMD+w (close all buffers)
-- SHIFT + click (select lines between cursor and click)
-- CMD+c (if selection > copy; if not > select and copy line)
-- Visual mode: () {} [] <> '' "" `` (wrap selection)
-- @hover documentation
-- CMD+d (normal/ insert mode): select word under cursor
-- CMD+d (visual mode): select next occurrence
-- Terminal mode keymaps
-- CMD+1,2,3,etc (switch tabs)
-- Shift+Tab (unindent)
-- CMD+l (select line)
-- Go to definition???

-- stylua: ignore start

vim.keymap.set({ "n" }, "<Esc>", "<CMD>nohlsearch<CR>", { silent = true, desc = "Exit search" })
vim.keymap.set({ "n", "v" }, "<D-f>", "/", { desc = "Search (CMD+f)" })
vim.keymap.set({ "n" }, "<S-D-p>", ":", { desc = "Open cmdline (Shift+CMD+p)" })
vim.keymap.set({ "i" }, "<leader>jk", "<Esc>", { desc = "Exit insert mode (Space+jk)" })
vim.keymap.set({ "n" }, "<leader>so", "<CMD>source $MYVIMRC<CR>", { silent = true, desc = "Source config (Space+so)" })
vim.keymap.set({ "n" }, "<leader><space>", "i", { desc = "Enter insert mode (Space+Space)" })
vim.keymap.set({ "n" }, "<leader>kw", "<CMD>bufdo bwipeout<CR>", { silent = true, desc = "Close all buffers (Space+kw)" })

vim.keymap.set({ "n", "v" }, "d", '"_d', { noremap = true })
vim.keymap.set("n", "dd", '"_dd', { noremap = true })

-- Save
vim.keymap.set({ "n" }, "<D-s>", "<CMD>silent! update | redraw<CR>", { desc = "Save buffer (CMD+s)" })
vim.keymap.set({ "i", "x" }, "<D-s>", "<ESC><CMD>silent! update | redraw<CR>", { desc = "Save buffer (CMD+s)" })

-- Close
vim.keymap.set({ "n" }, "<D-w>", "<CMD>q<CR>", { silent = true, noremap = true, desc = "Close buffer (CMD+w)" })
vim.keymap.set({ "n" }, "<S-D-w>", "<CMD>q!<CR>", { silent = true, desc = "Force close buffer (Shift+CMD+w)" })

-- Undo, Redo,
vim.keymap.set({ "n", "v", "i" }, "<D-z>", "<CMD>undo<CR>", { silent = true, desc = "Undo (CMD+Z)" })
vim.keymap.set({ "n", "v", "i" }, "<S-D-z>", "<CMD>redo<CR>", { silent = true, desc = "Redo (Shift+CMD+z)" })

-- Move cursor left/ right one word
vim.keymap.set({ "n", "v" }, "<A-Left>", "b", { desc = "Move cursor left (Option+Left)" })
vim.keymap.set({ "n", "v" }, "<A-Right>", "w", { desc = "Move cursor right (Option+Right)" })
vim.keymap.set({ "i" }, "<A-Left>", "<C-O>b", { desc = "Move cursor left (Option+Left)" })
vim.keymap.set({ "i" }, "<A-Right>", "<C-O>w", { desc = "Move cursor right (Option+Right)" })

-- Move cursor to start/ end of lines
vim.keymap.set({ "n", "v" }, "<D-Left>", "_", { desc = "Jump to beginning of line (CMD+Left)" })
vim.keymap.set({ "n", "v" }, "<D-Right>", "$", { desc = "Jump to end of line (CMD+Right)" })
vim.keymap.set({ "v" }, "<S-D-Left>", "_", { desc = "Jump to beginning of line (Shift+CMD+Left)" })
vim.keymap.set({ "v" }, "<S-D-Right>", "$", { desc = "Jump to end of line (Shift+CMD+Right)" })
vim.keymap.set({ "i" }, "<D-Left>", "<C-O>_", { desc = "Jump to beginning of line (CMD+Left)" })
vim.keymap.set({ "i" }, "<D-Right>", "<C-O>$", { desc = "Jump to end of line (CMD+Right)" })

-- Jump to beginning/ end of file
vim.keymap.set({ "n" }, "<D-Up>", "gg", { desc = "Jump to beginning of file (CMD+Up)" })
vim.keymap.set({ "n" }, "<D-Down>", "G", { desc = "Jump to end of file (CMD+Down)" })
vim.keymap.set({ "i" }, "<D-Up>", "<C-O>gg", { desc = "Jump to beginning of file (CMD+Up)" })
vim.keymap.set({ "i" }, "<D-Down>", "<C-O>G", { desc = "Jump to end of file (CMD+Down)" })

-- Select words/ lines (normal mode)
vim.keymap.set({ "n" }, "<S-Up>", "v<Up>", { desc = "Select up (Shift+Up)" })
vim.keymap.set({ "n" }, "<S-Down>", "v<Down>", { desc = "Select down (Shift+Down)" })
vim.keymap.set({ "n" }, "<S-Left>", "v<Left>", { desc = "Select left (Shift+Left)" })
vim.keymap.set({ "n" }, "<S-Right>", "v<Right>", { desc = "Select right (Shift+Right)" })

-- Select words/ lines (visual mode)
vim.keymap.set({ "v" }, "<S-Up>", "<Up>")
vim.keymap.set({ "v" }, "<S-Down>", "<Down>")
vim.keymap.set({ "v" }, "<S-Left>", "<Left>")
vim.keymap.set({ "v" }, "<S-Right>", "<Right>")
vim.keymap.set({ "v" }, "<S-A-Left>", "b")
vim.keymap.set({ "v" }, "<S-A-Right>", "w")

-- Select words/ lines (insert mode)
vim.keymap.set({ "i" }, "<S-Up>", "<C-O>v<Up>")
vim.keymap.set({ "i" }, "<S-Down>", "<C-O>v<Down>")
vim.keymap.set({ "i" }, "<S-Left>", "<C-O>v<Left>")
vim.keymap.set({ "i" }, "<S-Right>", "<C-O>v<Right>")

-- Select line
vim.keymap.set({ "n" }, "<D-l>", "V", { desc = "Select line (CMD+l)" })

-- Move lines up/ down
vim.keymap.set({ "n" }, "<A-Up>", ":m .-2<CR>==", { silent = true, desc = "Move line up (Option+Up)" })
vim.keymap.set({ "n" }, "<A-Down>", ":m .+1<CR>==", { silent = true, desc = "Move line down (Option+Down)" })
vim.keymap.set({ "v" }, "<A-Up>", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move line up (Option+Up)" })
vim.keymap.set({ "v" }, "<A-Down>", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move line down (Option+Down)" })

-- Duplicate line
vim.keymap.set({ "n", "v" }, "<S-A-Down>", "<CMD>t.<CR>", { silent = true, desc = "Duplicate line (Shift+Option+Down)" })
vim.keymap.set({ "i" }, "<S-A-Down>", "<C-O><CMD>t.<CR>", { silent = true, desc = "Duplicate line (Shift+Option+Down)" })

-- Delete words/ lines
vim.keymap.set({ "i" }, "<A-BS>", "<C-W>", { desc = "Delete word (Option+Backspace)" })
vim.keymap.set({ "i" }, "<C-U>", "<C-O>d0", { desc = "Delete line (CMD+Backspace)" }) -- NOTE: CMD+Backspace is bound to CTRL+U in alacritty/ wezterm

-- Split window
vim.keymap.set({ "n" }, "<C-D-Right>", "<CMD>vsplit<CR>", { silent = true, desc = "Split window right (CTRL+CMD+Right)" })
vim.keymap.set({ "n" }, "<C-D-Down>", "<CMD>split<CR>", { silent = true, desc = "Split window down (CTRL+CMD+Down)" })

-- stylua: ignore end
