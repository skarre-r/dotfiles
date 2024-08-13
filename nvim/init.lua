-------------------------------------------------------------------------------
-- Options
-------------------------------------------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.breakindent = true
vim.opt.list = true -- show invisible characters
vim.opt.listchars = { trail = "·", nbsp = "␣" }
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
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-------------------------------------------------------------------------------
-- Autocommands
-------------------------------------------------------------------------------
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("custom-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
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
		-- https://github.com/loctvl842/monokai-pro.nvim
		{
			"loctvl842/monokai-pro.nvim",
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
						"telescope",
						"notify",
						"neo-tree",
						"bufferline",
					},
					plugins = {
						indent_blankline = {
							context_highlight = "pro", -- default | pro
							context_start_underline = true,
						},
					},
				})
				monokai.load() -- or `vim.cmd.colorscheme("monokai-pro")`
			end,
			lazy = false,
		},
		-- https://github.com/akinsho/bufferline.nvim
		{
			"akinsho/bufferline.nvim",
			version = "*",
			dependencies = "nvim-tree/nvim-web-devicons",
			opts = {},
		},
		-- https://github.com/nvim-lualine/lualine.nvim
		{
			"nvim-lualine/lualine.nvim",
			dependencies = { "nvim-tree/nvim-web-devicons" },
			opts = {
				options = {
					icons_enabled = true,
					theme = "monokai-pro",
				},
			},
		},
		-- https://github.com/nvim-neo-tree/neo-tree.nvim
		{
			"nvim-neo-tree/neo-tree.nvim",
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
		-- https://github.com/folke/noice.nvim
		{
			"folke/noice.nvim",
			version = "4.4.7", -- fixes cursor flickering
			dependencies = {
				"MunifTanjim/nui.nvim",
				"rcarriga/nvim-notify",
			},
			opts = {
				presets = { lsp_doc_border = true },
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
		-- https://github.com/folke/lazydev.nvim
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {},
		},
		-- https://github.com/nvim-telescope/telescope.nvim
		{
			"nvim-telescope/telescope.nvim",
			branch = "0.1.x",
			dependencies = {
				"nvim-lua/plenary.nvim",
			},
			keys = {
				{ "<leader>ff", "<CMD>Telescope find_files<CR>", mode = { "n", "v" } },
			},
			opts = {},
		},
		-- https://github.com/VonHeikemen/lsp-zero.nvim/
		{
			"VonHeikemen/lsp-zero.nvim", -- todo replace?
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
					-- todo keymaps?
					lsp_zero.default_keymaps({ buffer = bufnr })
				end
				lsp_zero.extend_lspconfig({
					sign_text = true,
					lsp_attach = lsp_attach,
					float_border = "rounded",
					capabilities = capabilities,
				})

				require("mason").setup({})
				require("mason-lspconfig").setup({
					ensure_installed = { "lua_ls", "gopls" },
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
						"golangci-lint",
					},
					auto_update = true,
					run_on_start = true,
				})

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
						-- todo more completion keybinds
						["<Enter>"] = cmp.mapping.confirm({ select = true }),
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
				notify_on_error = false,
				format_on_save = {
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
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
	},
})
