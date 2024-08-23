-- TODO: nvim-tree, neo-tree, oil, mini.files()
-- DOCS:
-- https://github.com/stevearc/oil.nvim
return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "<S-D-o>", "<CMD>Oil --float<CR>", mode = "n" },
	},
	opts = {
		default_file_explorer = false,
		columns = { "icon" },
		win_options = {
			wrap = false,
		},
		delete_to_trash = true,
		constrain_cursor = "editable",
		view_options = {
			show_hidden = true,
		},
		float = {
			padding = 10,
			max_width = 200,
			border = "rounded",
		},
	},
}
