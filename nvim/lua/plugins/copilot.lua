-- DOCS: https://github.com/zbirenbaum/copilot.lua
-- NOTE: run  :Copilot auth
-- TODO: https://tamerlan.dev/setting-up-copilot-in-neovim-with-sane-settings/
return {
	{
		"zbirenbaum/copilot.lua",
		cmd   = "Copilot",
		event = "InsertEnter",
		opts  = {
			panel = { enabled = true },
			suggestion = {
				enabled = true,
				auto_trigger = true,
				keymap = {
					accept = "<Tab>"
				}
			}
		},
	},
	{
		"zbirenbaum/copilot-cmp",
		enabled = false,
	}
}
