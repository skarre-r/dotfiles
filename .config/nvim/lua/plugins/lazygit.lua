-- https://github.com/kdheepak/lazygit.nvim
return {
    "kdheepak/lazygit.nvim",
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { "<leader>lg", "<CMD>LazyGit<CR>", desc = "LazyGit" },
    },
    config = function()
        require("telescope").load_extension("lazygit")
    end,
}
