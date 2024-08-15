-- TODO: lsp code actions (quick fixes)
-- TODO: telescope-fzf
-- TODO: nvim-tree: use left/ right to open/ close directories
-- TODO: copilot
-- TODO: nvim-cmp: more mappings: https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings
-- TODO: replace lsp-zero
-- TODO: split up lsp / cmp config
-- TODO: learn how tabs work
-- TODO: configure lazy loading: https://lazy.folke.io/spec/lazy_loading
-- TODO: find more plugins: https://dotfyle.com/neovim/plugins/top
-- TODO: friendly_snippets > cmp
-- TODO: telescope extensions? https://github.com/nvim-telescope/telescope.nvim/wiki/Extensions
-- TODO: telescope find_files: include hidden files
-- TODO: telescope find_files: no selection vs selection

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
vim.keymap.set({ "n" }, "<S-D-p>", ":", { desc = "Open cmdline (Shift+CMD+p)" })
vim.keymap.set({ "n" }, "<A-Left>", "b", { silent = true, desc = "Move cursor left (Option+Left)" })    -- TODO: doesn't work
vim.keymap.set({ "n" }, "<A-Right>", "e", { silent = true, desc = "Move cursor right (Option+Right)" }) -- TODO: doesn't work
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

-- terminal
vim.keymap.set({ "n", "v", "i", "t" }, "<D-j>", "<CMD>ToggleTerm<CR>",
    { silent = true, desc = "Toggle terminal (CMD+j)" })

-- telescope
vim.keymap.set({ "n", "v", "i" }, "<S-D-e>", "<CMD>NvimTreeToggle<CR>",
    { silent = true, desc = "Toggle file explorer (Shift+CMD+e)" })
vim.keymap.set({ "n", "v", "i" }, "<D-p>", "<CMD>Telescope find_files<CR>",
    { silent = true, desc = "Find files (CMD+p)" })
vim.keymap.set({ "n", "i" }, "<S-D-f>", "<CMD>Telescope grep_string<CR>",
    { silent = true, desc = "Search in files (Shift+CMD+f)" })
vim.keymap.set({ "v" }, "<S-D-f>", "<CMD>Telescope grep_string<CR>",
    { silent = true, desc = "Search for selection in files (Shift+CMD+f)" })
vim.keymap.set({ "n" }, "<leader>gs", "<CMD>Telescope git_status<CR>",
    { silent = true, desc = "Show git status (Space+gs)" })
vim.keymap.set({ "n" }, "<leader>gl", "<CMD>Telescope git_commits<CR>",
    { silent = true, desc = "Show git commit log (Space+gl)" })

-- trouble
vim.keymap.set({ "n" }, "<leader>xx", "<CMD>Trouble diagnostics toggle<CR>",
    { silent = true, desc = "Show diagnostics (Space+xx)" })
vim.keymap.set({ "n" }, "<leader>todo", "<CMD>Trouble todo toggle<CR>",
    { silent = true, desc = "Show todos (Space+todo)" })

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
    install = { missing = true },
    checker = { enabled = true, notify = true, frequency = 3600 },
    change_detection = { enabled = true, notify = false },
    performance = { cache = { enabled = true } },
    reset_packpath = true,
    spec = {
        -- https://github.com/nvim-tree/nvim-web-devicons
        {
            "nvim-tree/nvim-web-devicons",
            lazy = false,
            opts = { color_icons = true },
        },
        -- https://github.com/loctvl842/monokai-pro.nvim
        {
            "loctvl842/monokai-pro.nvim",
            lazy = false,
            priority = 1000,
            dependencies = {
                "nvim-tree/nvim-web-devicons",
            },
            config = function()
                local monokai = require("monokai-pro")
                monokai.setup({
                    terminal_colors = true,
                    devicons = true,
                    filter = "pro",
                    background_clear = {
                        "toggleterm",
                        "telescope",
                        "notify",
                        "neo-tree",
                        "nvim-tree",
                        "bufferline",
                    },
                    plugins = {
                        bufferline = {
                            underline_selected = false,
                            underline_visible = false,
                        },
                        indent_blankline = {
                            context_highlight = "pro", -- default | pro
                            context_start_underline = true,
                        },
                    },
                })
                vim.cmd.colorscheme("monokai-pro") -- or `monokai.load()`
            end,
        },
        -- https://github.com/lewis6991/gitsigns.nvim
        {
            "lewis6991/gitsigns.nvim",
            event = "VeryLazy",
            opts = {},
        },
        -- https://github.com/akinsho/bufferline.nvim
        {
            "akinsho/bufferline.nvim",
            version = "*",
            dependencies = {
                "nvim-tree/nvim-web-devicons",
            },
            opts = {
                options = {
                    mode = "buffers", -- "buffers" | "tabs"
                    diagnostics = "nvim_lsp",
                    offsets = {
                        {
                            filetype = "NvimTree",
                            text = "NvimTree_1", -- or function,
                            text_align = "left", -- "left" | "center" | "right"
                            separator = true,
                        },
                    },
                    color_icons = true,
                    show_buffer_icons = true,
                    show_buffer_close_icons = true,
                    show_close_icon = true,
                    show_tab_indicators = true,
                    separator_style = "thin", -- "slant" | "slope" | "thick" | "thin"
                    always_show_bufferline = true,
                    auto_toggle_bufferline = true,
                    hover = {
                        enabled = true,
                    },
                },
            },
        },
        -- https://github.com/nvim-lualine/lualine.nvim
        {
            "nvim-lualine/lualine.nvim",
            dependencies = { "nvim-tree/nvim-web-devicons" },
            opts = {
                options = {
                    icons_enabled = true,
                    theme = "auto", -- or "monokai-pro"
                },
            },
        },
        -- https://github.com/nvim-tree/nvim-tree.lua
        {
            "nvim-tree/nvim-tree.lua",
            version = "*",
            lazy = false,
            dependencies = {
                "nvim-tree/nvim-web-devicons",
            },
            opts = {
                on_attach = "default",
                hijack_cursor = true,
                auto_reload_on_write = true,
                disable_netrw = true,
                hijack_netrw = true,
                hijack_unnamed_buffer_when_opening = true,
                sync_root_with_cwd = true,
                respect_buf_cwd = true,
                view = {
                    cursorline = true,
                    side = "left",
                    number = false,
                    relativenumber = false,
                    width = 30,
                    float = {
                        enable = false,
                    },
                },
                renderer = {
                    add_trailing = true,
                    group_empty = true,
                    indent_width = 2,
                    hightlight_git = "all",
                    hightlight_diagnostics = "all",
                    hightlight_opened_files = "all",
                    hightlight_modified = "all",
                    hightlight_hidden = "all",
                    indent_markers = {
                        enable = true,
                    },
                    icons = {
                        web_devicons = {
                            file = {
                                enable = true,
                                color = false,
                            },
                            folder = {
                                enable = true,
                                color = false,
                            },
                        },
                    },
                },
                git = {
                    enable = true,
                },
                update_focused_file = {
                    enable = true,
                    update_root = {
                        enable = true,
                    },
                },
                diagnostics = {
                    enable = true,
                },
            },
        },
        -- https://github.com/folke/lazydev.nvim
        {
            "folke/lazydev.nvim",
            ft = "lua",
            opts = {},
        },
        -- https://github.com/rcarriga/nvim-notify
        {
            "rcarriga/nvim-notify",
            opts = {
                stages = "static", -- disable animations
                timeout = 3000,
            },
        },
        -- https://github.com/folke/noice.nvim
        {
            "folke/noice.nvim",
            version = "4.4.7", -- fixes cursor flickering
            dependencies = {
                "MunifTanjim/nui.nvim",
                "rcarriga/nvim-notify",
            },
            opts = {
                cmdline = {
                    enabled = true,
                    view = "cmdline_popup", -- "cmdline" | "cmdline_popup",
                    opts = {},
                },
                messages = {
                    enabled = true,
                },
                popupmenu = {
                    enabled = true,
                    backend = "nui",
                },
                notify = {
                    enabled = true,
                    view = "notify",
                },
                lsp = {
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true,
                    },
                    hover = { enabled = true },
                    signature = {
                        enabled = true,
                        auto_open = { enabled = true, trigger = true, luasnip = true },
                        opts = {},
                    },
                    message = {
                        enabled = true,
                        view = "notify",
                        opts = {},
                    },
                    documentation = {
                        view = "hover",
                    },
                },
                -- docs: https://github.com/folke/noice.nvim/blob/main/lua/noice/config/views.lua
                views = {
                    hover = {
                        border = {
                            style = "rounded",
                        },
                        position = { row = 2, col = 2 },
                    },
                    cmdline_popup = {
                        position = {
                            row = 3,
                            col = "50%",
                        },
                        size = {
                            min_width = 60,
                            width = "auto",
                            height = "auto",
                        },
                    },
                    cmdline_popupmenu = {
                        relative = "editor",
                        position = {
                            row = 6,
                            col = "50%",
                        },
                        size = {
                            width = 60,
                            height = "auto",
                            max_height = 33,
                        },
                        border = {
                            style = "rounded",
                            padding = { 0, 1 },
                        },
                        win_options = {
                            winhighlight = { Normal = "Normal", FloatBorder = "NoiceCmdlinePopupBorder" },
                        },
                    },
                },
            },
        },
        -- https://github.com/folke/trouble.nvim
        {
            "folke/trouble.nvim",
            cmd = { "Trouble" },
            event = "VeryLazy",
            opts = {
                modes = {
                    lsp = { win = { position = "right" } },
                },
            },
        },
        -- NOTE: https://github.com/nvim-telescope/telescope-fzf-native.nvim
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            event = "VeryLazy",
        },
        -- NOTE: https://github.com/nvim-telescope/telescope.nvim
        {
            "nvim-telescope/telescope.nvim",
            branch = "0.1.x",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-telescope/telescope-fzf-native.nvim",
            },
            cmd = { "Telescope" },
            event = "VeryLazy",
            config = function()
                local actions = require("telescope.actions")
                local telescope = require("telescope")
                telescope.setup({
                    defaults = {
                        scroll_strategy = "cycle",
                        initial_mode = "insert",
                        mappings = {
                            i = {
                                ["<esc>"] = actions.close,
                            },
                        },
                        color_devicons = true,
                    },
                    extensions = {
                        fzf = {
                            fuzzy = true,
                            override_generic_sorter = true,
                            override_file_sorter = true,
                            case_mode = "smart_case",
                        }
                    }
                })
                telescope.load_extension("noice")
                telescope.load_extension("notify")
                telescope.load_extension("fzf")
            end,
        },
        -- https://github.com/VonHeikemen/lsp-zero.nvim/
        {

            "VonHeikemen/lsp-zero.nvim",
            branch = "v4.x",
            dependencies = {
                "neovim/nvim-lspconfig",
                "williamboman/mason.nvim",
                "williamboman/mason-lspconfig.nvim",
                "WhoIsSethDaniel/mason-tool-installer.nvim",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "hrsh7th/nvim-cmp",
                "L3MON4D3/LuaSnip",
                "saadparwaiz1/cmp_luasnip",
            },
            config = function()
                local cmp_lsp = require("cmp_nvim_lsp")
                local capabilities = vim.tbl_deep_extend(
                    "force",
                    vim.lsp.protocol.make_client_capabilities(),
                    cmp_lsp.default_capabilities()
                )

                local lsp_zero = require("lsp-zero")
                local lsp_attach = function(client, bufnr)
                    lsp_zero.default_keymaps({ buffer = bufnr })
                    if client.server_capabilities.inlayHintProvider then
                        vim.lsp.inlay_hint.enable(true, { bufnr })
                    end
                end
                lsp_zero.extend_lspconfig({
                    sign_text = true,
                    lsp_attach = lsp_attach,
                    float_border = "rounded",
                    capabilities = capabilities,
                })
                require("mason").setup({})
                require("mason-lspconfig").setup({
                    ensure_installed = { "lua_ls", "gopls", "basedpyright", "pyright" },
                    handlers = {
                        -- "default handler": used by language servers without their own handler
                        function(server_name)
                            require("lspconfig")[server_name].setup({
                                capabilities = capabilities,
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
                                        hint = {
                                            enable = true,
                                        },
                                    },
                                },
                            })
                        end,
                        ["gopls"] = function()
                            require("lspconfig").gopls.setup({
                                capabilities = capabilities,
                                settings = {
                                    gopls = {
                                        ["ui.inlayhint.hints"] = {
                                            rangeVariableTypes = true,
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
                    },
                })
                require("mason-tool-installer").setup({
                    ensure_installed = {
                        "ruff",
                        "biome",
                        "stylua",
                        "prettier",
                        "eslint_d",
                        "goimports",
                        "golangci-lint",
                    },
                    auto_update = true,
                    run_on_start = true,
                })
                local cmp = require("cmp")
                cmp.setup({
                    sources = {
                        { name = "path" },
                        { name = "nvim_lsp" },
                        { name = "luasnip" },
                        { name = "buffer" },
                    },
                    window = {
                        completion = cmp.config.window.bordered(),
                        documentation = cmp.config.window.bordered(),
                    },
                    snippet = {
                        expand = function(args)
                            require("luasnip").lsp_expand(args.body)
                        end,
                    },
                    mapping = cmp.mapping.preset.insert({
                        ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
                        ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
                        ["<Enter>"] = cmp.mapping(cmp.mapping.confirm({ select = true }), { "i", "c" }),
                        ["<C-space>"] = cmp.mapping(function(callback)
                            if cmp.visible() then
                                cmp.abort()
                            else
                                cmp.complete()
                            end
                        end, { "i", "c" }),
                    }),
                    formatting = lsp_zero.cmp_format({ details = true }),
                    preselect = "item",
                    completion = {
                        completeopt = "menu,menuone,noinsert",
                    },
                })
            end,
        },
        {
            "stevearc/conform.nvim",
            event = "VeryLazy",
            opts = {
                notify_on_error = true,
                default_format_opts = {
                    lsp_format = "fallback",
                },
                format_on_save = {
                    lsp_format = "fallback",
                    timeout_ms = 500,
                },
                format_after_save = {
                    lsp_format = "fallback",
                },
                formatters_by_ft = {
                    lua = { "stylua" },
                    python = { "ruff" },
                    css = { "prettier" },
                    html = { "prettier" },
                    json = { "prettier" },
                    yaml = { "prettier" },
                    markdown = { "prettier" },
                    graphql = { "prettier" },
                    javascript = { "biome", "prettier", stop_after_first = true },
                    typescript = { "biome", "prettier", stop_after_first = true },
                    javascriptreact = { "biome", "prettier", stop_after_first = true },
                    typescriptreact = { "biome", "prettier", stop_after_first = true },
                    go = { "goimports", "gofmt" },
                },
            },
        },
        -- https://github.com/mfussenegger/nvim-lint
        {
            "mfussenegger/nvim-lint",
            event = "VeryLazy",
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
                    group = vim.api.nvim_create_augroup("line", { clear = true }),
                    callback = function()
                        lint.try_lint()
                    end,
                })
            end,
        },
        -- https://github.com/nvim-treesitter/nvim-treesitter
        {
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
                        "python",
                    },
                    highlight = { enable = true },
                })
            end,
        },
        -- https://github.com/lukas-reineke/indent-blankline.nvim
        {
            "lukas-reineke/indent-blankline.nvim",
            main = "ibl",
            event = "VeryLazy",
            opts = {
                indent = {
                    char = "│",
                    tab_char = "│",
                },
                scope = { show_start = false, show_end = false },
            },
        },
        -- https://github.com/folke/todo-comments.nvim
        {
            "folke/todo-comments.nvim",
            dependencies = { "nvim-lua/plenary.nvim" },
            event = "VeryLazy",
            opts = {},
        },
        -- https://github.com/akinsho/toggleterm.nvim
        {
            "akinsho/toggleterm.nvim",
            version = "*",
            event = "VeryLazy",
            opts = {
                size = 25,
                direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float',
                float_opts = {
                    border = "curved",
                },
                auto_scroll = true,
                start_in_insert = true,
                autochdir = false,
            },
        },
        -- NOTE: https://github.com/windwp/nvim-autopairs
        {
            "windwp/nvim-autopairs",
            event = "InsertEnter",
            opts = { check_ts = true }
        },
        -- NOTE: https://github.com/folke/ts-comments.nvim
        {
            "folke/ts-comments.nvim",
            event = "VeryLazy",
            opts = {}
        },
        -- NOTE: https://github.com/windwp/nvim-ts-autotag
        {
            "windwp/nvim-ts-autotag",
            event = { "BufReadPre", "BufNewFile" },
            opts = {
                enable_close = true,
                enable_rename = true,
                enable_close_on_slash = true
            }
        },
        -- TODO: enable
        {
            "folke/flash.nvim",
            enabled = false,
        },
        {
            "vim-test/vim-test",
            enabled = false,
        },
        {
            "RRethy/vim-illuminate",
            enabled = false,
        },
        {
            "rafamadriz/friendly-snippets",
            enabled = false,
        },
        {
            'stevearc/oil.nvim',
            enabled = false
        },
        {
            "iamcco/markdown-preview.nvim",
            enabled = false,
        },
        {
            "folke/zen-mode.nvim",
            enabled = false
        },
        {
            "folke/which-key.nvim",
            enabled = false
        },
        {
            "folke/edgy.nvim",
            enabled = false,
        },
        {
            "folke/persistence.nvim",
            enabled = false
        },
        {
            "kylechui/nvim-surround",
            enabled = false,
            version = "*", -- Use for stability; omit to use `main` branch for the latest features
            event = "VeryLazy",
            opts = {},
        },
    },
})

-------------------------------------------------------------------------------
-- Graveyard
-------------------------------------------------------------------------------
local dead_plugins = {
    -- https://github.com/nvim-neo-tree/neo-tree.nvim
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        opts = {
            close_if_last_window = true,
            filesystem = {
                filtered_items = {
                    visible = true,
                },
                follow_current_file = {
                    enabled = true,
                },
                hijack_netrw_behavior = "disabled", -- "open_default" | "open_current" | "disabled",
                use_libuv_file_watcher = false,
            },
            buffers = {
                follow_current_file = {
                    enabled = true,
                },
            },
        },
    },
}
