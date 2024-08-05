return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'j-hui/fidget.nvim'
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({})
    end
}
