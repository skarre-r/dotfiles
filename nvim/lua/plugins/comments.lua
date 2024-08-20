-- DOCS:
-- https://github.com/folke/todo-comments.nvim
-- https://github.com/folke/ts-comments.nvim
return {
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			signs = true,
			keywords = {
				NOTE = { color = "custom" },
				DOCS = { color = "custom" }
			},
			merge_keywords = true,
			highlight = {
				multiline = true,
				comments_only = true
			},
			colors = {
				custom = { "DiagnosticOk" }
			}
		}
	},
	{
		"folke/ts-comments.nvim",
		event = "InsertEnter",
		opts = {},
	},
}
