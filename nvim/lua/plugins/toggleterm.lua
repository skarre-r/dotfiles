-- DOCS:
-- https://github.com/akinsho/toggleterm.nvim
return {
	"akinsho/toggleterm.nvim",
	version = "*",
	keys = {
		-- NOTE: toggle terminal w/ CMD+j
		{ "<D-j>", "<CMD>ToggleTerm<CR>", mode = { "n", "v", "i", "t" } },
		{ "<S-D-j>", "<CMD>ToggleTerm<CR>", mode = { "n", "v", "i", "t" } },
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
}
