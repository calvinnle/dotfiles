return {
  {
    "folke/tokyonight.nvim",
    priority = 1000, -- Make sure to load this before other start plugins
    config = function()
      require("tokyonight").setup({
        style = "night", -- Default style
        transparent = true, -- Enable transparency
        styles = {
          sidebars = "transparent", -- Transparent sidebars
          floats = "transparent", -- Transparent floating windows
        },
        on_colors = function(colors)
          -- Optional: Customize colors if needed
        end,
      })
      -- Load the colorscheme
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
}
