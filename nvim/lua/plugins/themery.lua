return {
  {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup({
        themes = {
          {
            name = "rose-pine",
            colorscheme = "rose-pine",
          },
          {
            name = "latte",
            colorscheme = "catppuccin-latte",
          },
          {
            name = "frappe",
            colorscheme = "catppuccin-frappe",
          },
          {
            name = "mocha",
            colorscheme = "catppuccin-mocha",
          },
          {
            name = "catppuccin - custom to be dark af",
            colorscheme = "catppuccin-macchiato",
          },

          {
            name = "kanagawa-lotus",
            colorscheme = "kanagawa-lotus",
          },
          {
            name = "kanagawa-night",
            colorscheme = "kanagawa-dragon",
          },
          {
            name = "nightfox",
            colorscheme = "nightfox",
          },
          {
            name = "nordfox",
            colorscheme = "nordfox",
          },
          {
            name = "tokyonight",
            colorscheme = "tokyonight-moon",
          },
          {
            name = "solarized",
            colorscheme = "solarized",
          },
          {
            name = "monokai-spectrume",
            colorscheme = "monokai-pro",
          },
          {
            name = "nord",
            colorscheme = "nord",
          },
          {
            name = "github light",
            colorscheme = "github_light",
          },
          {
            name = "github dark",
            colorscheme = "github_dark",
          },
          {
            name = "gruvbox",
            colorscheme = "gruvbox",
          },
        },

        vim.keymap.set("n", "<leader>cc", ":Themery<CR>"),
      })
    end,
  },
  { 'projekt0n/github-nvim-theme', name = 'github-theme' },
  { "ellisonleao/gruvbox.nvim",    priority = 1000,      config = true, opts = ... },
  {
    "shaunsingh/nord.nvim",
  },
  {
    "loctvl842/monokai-pro.nvim",
    config = function()
      require("lualine").setup({
        options = {
          -- ...
          theme = "monokai-spectrume",
          -- ...
        },
      })
    end,
  },

  -- solarized
  {
    "maxmx03/solarized.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function(_, opts)
      vim.o.termguicolors = true
      vim.o.background = "light"
      require("solarized").setup(opts)
    end,
  },

  { "EdenEast/nightfox.nvim" }, -- lazy

  -- kanagawa
  {
    "rebelot/kanagawa.nvim",
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    -- priority = 1000,

    config = function()
      require("catppuccin").setup({
        flavour = "latte", -- latte, frappe, macchiato, mocha
        background = { -- :h background
          light = "latte",
          dark = "mocha",
        },
        transparent_background = false, -- disables setting the background color.
        show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
        term_colors = true,         -- sets terminal colors (e.g. `g:terminal_color_0`)
        dim_inactive = {
          enabled = false,          -- dims the background color of inactive window
          shade = "dark",
          percentage = 0.15,        -- percentage of the shade to apply to the inactive window
        },
        no_italic = false,          -- Force no italic
        no_bold = false,            -- Force no bold
        no_underline = false,       -- Force no underline
        styles = {                  -- Handles the styles of general hi groups (see `:h highlight-args`):
          comments = { "italic" },  -- Change the style of comments
          conditionals = { "italic" },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
          -- miscs = {}, -- Uncomment to turn off hard-coded styles
        },
        color_overrides = {
          macchiato = {
            base = "#000000",
            mantle = "#000000",
            crust = "#000000",
          },
        },
        custom_highlights = {},
        default_integrations = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = false,
          mini = {
            enabled = true,
            indentscope_color = "",
          },
          -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        },
      })

      -- setup must be called before loading
    end,
  },
  {
    -- tokyonight
    "folke/tokyonight.nvim",
    -- priority = 1000,
    config = function()
      local transparent = false -- set to true if you would like to enable transparency

      local bg = "#011628"
      local bg_dark = "#011423"
      local bg_highlight = "#143652"
      local bg_search = "#0A64AC"
      local bg_visual = "#275378"
      local fg = "#CBE0F0"
      local fg_dark = "#B4D0E9"
      local fg_gutter = "#627E97"
      local border = "#547998"

      require("tokyonight").setup({
        style = "night",
        transparent = transparent,
        styles = {
          sidebars = transparent and "transparent" or "dark",
          floats = transparent and "transparent" or "dark",
        },
        on_colors = function(colors)
          colors.bg = bg
          colors.bg_dark = transparent and colors.none or bg_dark
          colors.bg_float = transparent and colors.none or bg_dark
          colors.bg_highlight = bg_highlight
          colors.bg_popup = bg_dark
          colors.bg_search = bg_search
          colors.bg_sidebar = transparent and colors.none or bg_dark
          colors.bg_statusline = transparent and colors.none or bg_dark
          colors.bg_visual = bg_visual
          colors.border = border
          colors.fg = fg
          colors.fg_dark = fg_dark
          colors.fg_float = fg
          colors.fg_gutter = fg_gutter
          colors.fg_sidebar = fg_dark
        end,
      })

      -- vim.cmd("colorscheme tokyonight-moon")
    end,
  },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        variant = "dawn",  -- auto, main, moon, or dawn
        dark_variant = "dawm", -- main, moon, or dawn
        dim_inactive_windows = false,
        extend_background_behind_borders = true,

        enable = {
          terminal = false,
          legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
          migrations = true,   -- Handle deprecated options automatically
        },

        styles = {
          bold = true,
          italic = true,
          transparency = false,
        },

        groups = {
          border = "muted",
          link = "iris",
          panel = "surface",

          error = "love",
          hint = "iris",
          info = "foam",
          note = "pine",
          todo = "rose",
          warn = "gold",

          git_add = "foam",
          git_change = "rose",
          git_delete = "love",
          git_dirty = "rose",
          git_ignore = "muted",
          git_merge = "iris",
          git_rename = "pine",
          git_stage = "iris",
          git_text = "rose",
          git_untracked = "subtle",

          h1 = "iris",
          h2 = "foam",
          h3 = "rose",
          h4 = "gold",
          h5 = "pine",
          h6 = "foam",
        },

        palette = {
          -- Override the builtin palette per variant
          -- moon = {
          --     base = '#18191a',
          --     overlay = '#363738',
          -- },
        },

        -- NOTE: Highlight groups are extended (merged) by default. Disable this
        -- per group via `inherit = false`
        highlight_groups = {
          -- Comment = { fg = "foam" },
          -- StatusLine = { fg = "love", bg = "love", blend = 15 },
          -- VertSplit = { fg = "muted", bg = "muted" },
          -- Visual = { fg = "base", bg = "text", inherit = false },
        },

        before_highlight = function(group, highlight, palette)
          -- Disable all undercurls
          -- if highlight.undercurl then
          --     highlight.undercurl = false
          -- end
          --
          -- Change palette colour
          -- if highlight.fg == palette.pine then
          --     highlight.fg = palette.foam
          -- end
        end,
      })

      -- vim.cmd("colorscheme rose-pine-main")
      -- vim.cmd("colorscheme rose-pine-moon")
      -- vim.cmd("colorscheme rose-pine-dawn")
      -- vim.cmd("colorscheme rose-pine")
    end,
  },
}
