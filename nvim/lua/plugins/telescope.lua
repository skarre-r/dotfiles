-- https://github.com/nvim-telescope/telescope.nvim
return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    cmd = { "Telescope" },
    event = "VeryLazy",
    keys = {
        -- FIX: toggle w/ CMD+p
        { "<D-p>",      "<CMD>Telescope find_files<CR>",  mode = { "n", "v", "i" } },
        -- FIX: only use selection in visual mode
        { "<S-D-f>",    "<CMD>Telescope grep_string<CR>", mode = { "n", "i" } },
        { "<S-D-f>",    "<CMD>Telescope grep_string<CR>", mode = { "v" } },
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
                mappings = {
                    i = {
                        ["<esc>"] = actions.close,
                        ["<D-Up>"] = actions.move_to_top,
                        ["<D-Down>"] = actions.move_to_bottom,
                        ["<D-BS>"] = false,
                        ["<A-BS>"] = false
                    },
                },
                color_devicons = true,
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
        telescope.load_extension("fzf")
    end,
}
