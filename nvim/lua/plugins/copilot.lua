-- DOCS: https://github.com/zbirenbaum/copilot.lua
-- NOTE: run  :Copilot auth
-- TODO: https://tamerlan.dev/setting-up-copilot-in-neovim-with-sane-settings/
return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		keys = {
			{
				-- NOTE: https://github.com/zbirenbaum/copilot.lua/discussions/153
				"<Tab>",
				function()
					if require("copilot.suggestion").is_visible() then
						require("copilot.suggestion").accept()
					else
						vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
					end
				end,
				mode = "i",
			},
			-- {
			-- 	"<Esc>",
			-- 	function()
			-- 		local pilot = require("copilot.suggestions")
			-- 		if pilot.is_visible() then  end
			-- 	end,
			-- 	mode = "i",
			-- },
		},
		opts = {
			panel = { enabled = false },
			suggestion = {
				enabled = true,
				auto_trigger = true,
				keymap = {
					--accept = "<Tab>"
				},
			},
		},
	},
	-- {
	-- 	"zbirenbaum/copilot-cmp",
	-- 	enabled = false,
	-- },
}
