-- DOCS:
-- https://github.com/loctvl842/monokai-pro.nvim
return {
	"loctvl842/monokai-pro.nvim",
	lazy = false,
	priority = 1000,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local monokai = require("monokai-pro")
		monokai.setup({
			terminal_colors = true,
			devicons = true,
			filter = "pro",
			background_clear = {
				"float_win",
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
		monokai.load() -- or `vim.cmd.colorscheme("monokai-pro")`
	end,
}
