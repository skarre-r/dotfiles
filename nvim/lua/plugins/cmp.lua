-- DOCS:
-- https://github.com/hrsh7th/nvim-cmp
return {
	"hrsh7th/nvim-cmp",
	version = false,
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"hrsh7th/cmp-nvim-lsp-document-symbol",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		{ "L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp" },
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"zbirenbaum/copilot-cmp",
		"kristijanhusak/vim-dadbod-completion",
		{
			"folke/lazydev.nvim",
			ft = "lua",
			cmd = "LazyDev",
			dependencies = { { "Bilal2453/luvit-meta", lazy = true } },
			opts = {
				library = { "lazy.nvim", { path = "luvit-meta/library", words = { "vim%.uv" } } },
				integrations = { lspconfig = true, cmp = true, coq = false },
			},
		},
	},
	config = function()
		local cmp = require("cmp")
		--require("luasnip.loaders.from_vscode").lazy_load() -- friendly_snippets
		cmp.setup({
			-- TODO: wtf does group_index do?
			sources = {
				{ name = "copilot", group_index = 2 },
				{ name = "nvim_lsp", group_index = 2 },
				{ name = "path", group_index = 2 },
				-- { name = "luasnip", group_index = 2 },
				{ name = "lazydev", group_index = 0 },
			},
			{
				{ name = "buffer" },
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				-- TODO: more mappings
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
			preselect = "item",
			completion = { completeopt = "menu,menuone,noinsert" },
		})

		cmp.setup.filetype({ "sql" }, {
			sources = {
				{ name = "vim-dadbod-completion" },
				{ name = "buffer" },
			},
		})

		-- cmp.setup.cmdline({ '/', '?' }, {})
		-- cmp.setup.cmdline(':', {})
	end,
}
