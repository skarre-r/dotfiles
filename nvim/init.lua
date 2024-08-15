------------------------------------------------------------------------------
-- Custom flags
-------------------------------------------------------------------------------
local tree = "nvim-tree" -- "nvim-tree" | "neo-tree"

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

-------------------------------------------------------------------------------
-- Keymap
-------------------------------------------------------------------------------
vim.keymap.set("n", "<Esc>", "<CMD>nohlsearch<CR>")
vim.keymap.set("n", "<S-D-p>", ":")

-- TODO:
-- ALT+left (word left)
-- ALT+right (word right)
-- ALT+up (move up)
-- ALT+down (move down)
-- CMD+left (sart of line)
-- CMD+right (end of line)
-- CMD+up (start of file)
-- CMD+down (end of file)
-- ALT+backspace (delete word left)
-- ALT+delete (delete word right)
-- CMD+backspace (delete line left)
-- CMD+delete (delete line right)
-- SHIFT+up (select line up) TODO: set to jump x lines up (TODO: visual mode)
-- SHIFT+down (select line down) TODO: set to jump x lines down (TODO. visual mode)
-- CTRL+CMD+right (split (and move) right)
-- CTRL+CMD+left (split (and move) left)
-- CMD+k (toggle line/ selection comment)
-- CMD+w (close buffer ???)
-- CMD+s (save)
-- CMD+k (split right?)
-- SHIFT+CMD+k (shift down?)
-- CMD+d (select matching selection)
-- CMD+click (go to definition)

-- TODO:
-- use up/ down arrows in cmdline
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
require("lazy").setup({ -- TODO: :so doesnt't work
	install = { missing = true },
	checker = { enabled = true, notify = true, frequency = 3600 },
	change_detection = { enabled = true, notify = false },
	performance = { cache = { enabled = true } },
	reset_packpath = true,
	spec = {
		-- https://github.com/nvim-tree/nvim-web-devicons
		{
			"nvim-tree/nvim-web-devicons",
			opts = { color_icons = true },
		},
		-- https://github.com/loctvl842/monokai-pro.nvim
		{
			"loctvl842/monokai-pro.nvim",
			enabled = true,
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
					-- TODO: learn how tabs work
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
			enabled = tree == "nvim-tree",
			version = "*",
			lazy = false,
			dependencies = {
				"nvim-tree/nvim-web-devicons",
			},
			keys = {
				-- TODO: left/ right to open/ close folders
				{ "<S-D-e>", "<CMD>NvimTreeToggle<CR>", mode = { "n", "i", "v" } },
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
		-- https://github.com/nvim-neo-tree/neo-tree.nvim
		{
			"nvim-neo-tree/neo-tree.nvim",
			enabled = tree == "neo-tree",
			branch = "v3.x",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"nvim-tree/nvim-web-devicons",
				"MunifTanjim/nui.nvim",
			},
			keys = {
				{ "<leader>nt", "<CMD>Neotree toggle<CR>", mode = "n" },
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
				presets = {
					bottom_search = false, -- use a classic bottom cmdline for search
					command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = false, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = true, -- add a border to hover docs and signature help
				},
				cmdline = {
					view = "cmdline_popup", -- "cmdline" | "cmdline_popup"
				},
				lsp = {
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
			},
		},
		-- https://github.com/folke/trouble.nvim
		{
			"folke/trouble.nvim",
			cmd = { "Trouble" },
			keys = {
				{ "<leader>xx", "<CMD>Trouble diagnostics toggle<CR>", mode = { "n", "v" } },
				{ "<leader>todo", "<CMD>Trouble todo toggle<CR>", mode = { "n", "v" } },
			},
			opts = {
				modes = {
					lsp = { win = { position = "right" } },
				},
			},
		},
		-- https://github.com/nvim-telescope/telescope.nvim
		{
			"nvim-telescope/telescope.nvim",
			branch = "0.1.x",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"nvim-telescope/telescope-fzf-native.nvim", -- TODO: fix
			},
			cmd = { "Telescope" },
			keys = {
				-- TODO: <S-D-f> = search in files (fzf?)
				{ "<D-p>", "<CMD>Telescope find_files<CR>", mode = { "n", "v", "i", "t" } },
				{ "<leader>ff", "<CMD>Telescope find_files<CR>", mode = { "n", "v" } },
				{ "<leader>gs", "<CMD>Telescope git_status<CR>", mode = { "n", "v" } },
				{ "<leader>gl", "<CMD>Telescope git_commits<CR>", mode = { "n", "v" } },
			},
			config = function()
				local actions = require("telescope.actions")
				local telescope = require("telescope")
				telescope.load_extension("noice")
				telescope.load_extension("notify")
				telescope.setup({
					defaults = {
						mappings = {
							i = {
								["<esc>"] = actions.close,
							},
						},
					},
				})
			end,
		},
		{
			"j-hui/fidget.nvim",
			tag = "v1.4.5",
			opts = {
				integration = {
					["nvim-tree"] = {
						enable = true,
					},
				},
			},
		},
		-- https://github.com/VonHeikemen/lsp-zero.nvim/
		{
			-- TODO: code actions (quick fix)
			"VonHeikemen/lsp-zero.nvim", -- TODO: replace?
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
				local cmp = require("cmp")
				local cmp_lsp = require("cmp_nvim_lsp")
				local capabilities = vim.tbl_deep_extend(
					"force",
					vim.lsp.protocol.make_client_capabilities(),
					cmp_lsp.default_capabilities()
				)

				local lsp_zero = require("lsp-zero")
				local lsp_attach = function(client, bufnr)
					-- TODO: keymaps?
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

				-- TODO: read cmd docs, update config
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
						-- TODO: more completion keybinds
						["<C-space>"] = cmp.mapping(function(callback)
							-- Togglw w/ CTRL+Space
							if cmp.visible() then
								cmp.abort()
							else
								cmp.complete()
							end
						end, { "i" }),
						--["<Enter>"] = cmp.mapping.confirm({ select = true }),
						["<CR>"] = cmp.mapping({
							i = function(fallback)
								if cmp.visible() and cmp.get_active_entry() then
									cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
								else
									fallback()
								end
							end,
							s = cmp.mapping.confirm({ select = true }),
							c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
						}),
						-- TODO: this breaks cmdline tab
						-- ["<Tab>"] = cmp.mapping(function(fallback)
						--     -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
						--     if cmp.visible() then
						--         local entry = cmp.get_selected_entry()
						--         if not entry then
						--             cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
						--         end
						--         cmp.confirm()
						--     else
						--         fallback()
						--     end
						-- end, { "i", "s", "c", }),
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
			opts = {},
		},
		-- https://github.com/akinsho/toggleterm.nvim
		{
			"akinsho/toggleterm.nvim",
			version = "*",
			keys = {
				{ "<D-j>", "<CMD>ToggleTerm<CR>", mode = { "t", "n", "v", "i" } },
			},
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
			"windwp/nvim-autopairs",
			enabled = false,
		},
		{
			"rafamadriz/friendly-snippets",
			enabled = false,
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

-- TODO: copilot
