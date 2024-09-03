-- https://github.com/stevearc/oil.nvim
return {
	"stevearc/oil.nvim",
	lazy = true,
	dependencies = { "echasnovski/mini.icons" },
	keys = {
		{ "<S-D-o>", "<CMD>Oil --float<CR>", mode = "n", noremap = true }, -- TODO: doesn't work in wezterm
	},
	opts = {
		default_file_explorer = false,
		delete_to_trash = true,
		view_options = { show_hidden = true },
		float = {
			padding = 10,
			max_width = 200,
			border = "rounded",
		},
	},
}
