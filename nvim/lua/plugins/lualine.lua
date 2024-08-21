-- NOTE: https://github.com/nvim-lualine/lualine.nvim
-- TODO: extend config
return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"someone-stole-my-name/yaml-companion.nvim",
	},
	opts = {
		options = {
			icons_enabled = true,
			theme = "auto", -- or "monokai-pro"
		},
		sections = {
			lualine_x = {
				"fileformat",
				"filetype", function()
				local schema = require("yaml-companion").get_buf_schema(0)
				if schema.result[1].name == "none" then
					return ""
				end
				return schema.result[1].name
			end
			}
		}
	},
}
