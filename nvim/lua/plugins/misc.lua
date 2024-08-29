-- DOCS:
-- https://github.com/windwp/nvim-autopairs
-- https://github.com/RRethy/vim-illuminate
return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = { check_ts = true },
	},
	{
		"RRethy/vim-illuminate",
		enabled = false, -- TODO: !
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			providers = { "lsp", "treesitter", "regex" },
			delay = 100,
		},
	},
}
