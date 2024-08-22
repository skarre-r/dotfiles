-- DOCS:
-- https://github.com/stevearc/oil.nvim
return {
	"stevearc/oil.nvim",
	-- dependencies = { "nvim-tree/nvim-web-devicons" },
	depedencies = {
		{ "echasnovski/mini.icons", opts = {} },
	},
	keys = {
		{ "<S-D-o>", "<CMD>Oil --float<CR>", mode = "n" },
	},
	opts = {
		default_file_explorer = false,
		colums = { "icon" },
		delete_to_trash = true,
		view_options = {
			show_hidden = true,
		},
		float = {
			padding = 10,
		},
	},
}
