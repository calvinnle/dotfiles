return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")

    config.setup({
      -- languages to install
      ensure_installed = {
        "c",
        "lua",
        "vim",
        "javascript",
        "typescript",
        "tsx",
        "vue",
        "html",
        "go",
        "nix",
        "gomod",
        "gowork",
        "gosum",
        "java",
        "json",
        "zig",
      },
      sync_install = false,
      auto_install = true,
      ignore_install = {}, -- required field
      modules = {},        -- required field

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      indent = {
        enable = true,
      },
    })
  end,
}
