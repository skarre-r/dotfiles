-- DOCS:
-- https://github.com/nvim-telescope/telescope.nvim
return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"someone-stole-my-name/yaml-companion.nvim",
	},
	cmd = { "Telescope" },
	keys = {
		-- FIX: toggle w/ CMD+p
		{ "<D-p>",      "<CMD>Telescope find_files<CR>",  mode = { "n", "v", "i" } },
		-- FIX: only use selection in visual mode
		{ "<S-D-f>",    "<CMD>Telescope grep_string<CR>", mode = { "n", "i" } },
		{ "<S-D-f>",    "<CMD>Telescope grep_string<CR>", mode = { "v", } },
		{ "<leader>gs", "<CMD>Telescope git_status<CR>",  mode = { "n" } },
		{ "<leader>gl", "<CMD>Telescope git_commits<CR>", mode = { "n" } },
	},
	config = function()
		local actions = require("telescope.actions")
		local telescope = require("telescope")
		telescope.setup({
			defaults = {
				scroll_strategy = "cycle",
				initial_mode = "insert",
				-- FIX: CMD+left, CMD+Right, Option+Left, Option+Right, Option+Backspace, CMD+Backspace
				-- NOTE: actions.edit_command_line, actions.set_command_line, actions.edit_search_line, actions.set_search_line
				mappings = {
					i = {
						["<esc>"] = actions.close,
						["<D-Up>"] = actions.move_to_top,
						["<D-Down>"] = actions.move_to_bottom,
					},
				},
				color_devicons = true,
			},
			pickers = {
				find_files = {
					hidden = true,
				},
				git_status = {
					mappings = {
						-- ["<CR>"] = actions.git_staging_toggle
					},
				},
				git_commits = {
					mappings = {
						-- ["<CR>"] = function(bufnr) end
					},
				},
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
		})
		telescope.load_extension("noice")
		telescope.load_extension("notify")
		telescope.load_extension("fzf")
		telescope.load_extension("yaml_schema")
	end,
}
