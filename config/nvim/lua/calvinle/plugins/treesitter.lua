return {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "go", "rust", "c", "cpp", "python", "java", "typescript", "javascript", "lua",
            },
            highlight = {
                enable = true,
            },
        })
    end,
}
