-- todo telescope: https://github.com/ThePrimeagen/harpoon/blob/harpoon2/README.md#telescope
return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("harpoon").setup()
    end
}
