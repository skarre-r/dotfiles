-- DOCS:
-- https://github.com/neovim/nvim-lspconfig
return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		-- NOTE: json schemas
		"b0o/schemastore.nvim",
		"someone-stole-my-name/yaml-companion.nvim",
	},
	config = function()
		local lspconfig = require('lspconfig')
		lspconfig.util.default_config.capabilities = vim.tbl_deep_extend(
			'force',
			lspconfig.util.default_config.capabilities,
			require('cmp_nvim_lsp').default_capabilities()
		)

		-- TODO: "taplo" - toml language server
		-- TODO: sqls vs sqlls
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "gopls", "basedpyright", "pyright", "jsonls", "yamlls" },
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,
				["lua_ls"] = function()
					require("lspconfig").lua_ls.setup({
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
						settings = {
							gopls = {
								["ui.inlayhint.hints"] = {
									rangeVariableTypes = false,
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
				["jsonls"] = function()
					require("lspconfig").jsonls.setup({
						settings = {
							json = {
								validate = { enable = true },
								schemas = require("schemastore").json.schemas()
							}
						}
					})
				end,
				["yamlls"] = function()
					local cfg = require("yaml-companion").setup({
						builtin_matchers = {
							kubernetes = { enabled = true }
						},
						schemas = {
							{
								name = "openapi",
								uri =
								"https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"
							}
						},
						lspconfig = {
							settings = {
								yaml = {
									validate = true,
									schemaStore = {
										enable = false,
										url = ""
									},
									schemas = require("schemastore").yaml.schemas()
								}
							}
						}
					})
					require("lspconfig").yamlls.setup(cfg)
				end,
			}
		})
	end
}
