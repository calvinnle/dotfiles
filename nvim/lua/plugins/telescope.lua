return {
  { "nvim-telescope/telescope-media-files.nvim" },
  { "nvim-lua/popup.nvim" },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      require("telescope").load_extension("media_files")

      telescope.setup({
        -- extensions = {
          --   media_files = {
            --     -- filetypes whitelist
            --     -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
            --     filetypes = { "png", "webp", "jpg", "jpeg" },
            --     -- find command (defaults to `fd`)
            --     find_cmd = "rg",
            --   },
            -- },
            pickers = {
              colorscheme = {
                enable_preview = true,
              },
            },
            defaults = {
              path_display = { "smart" },
              layout_config = {
                horizontal = {
                  preview_width = 0.6,
                },
              },
              file_ignore_patterns = {
                ".git",
                -- all your ignore settings come here
                "node_modules",
              }, -- Ensure this is empty to avoid exclusions
              mappings = {
                i = {
                  ["<C-k>"] = actions.move_selection_previous,
                  ["<C-j>"] = actions.move_selection_next,
                  ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                },
              },
            },
          })

          telescope.load_extension("fzf")

          -- set keymaps
          local keymap = vim.keymap -- for conciseness

          keymap.set("n", "<leader>sf", "<cmd>Telescope find_files hidden=true<cr>")
          keymap.set("n", "<leader>sr", "<cmd>Telescope oldfiles<cr>")
          keymap.set("n", "<leader>ss", "<cmd>Telescope live_grep<cr>")
          keymap.set("n", "<leader>sb", "<cmd>Telescope Buffers<cr>")
          keymap.set(
            "n",
            "<leader>sc",
            "<cmd>Telescope grep_string<cr>",
            { desc = "Find string under cursor in cwd" }
          )
          keymap.set(
            "n",
            "<leader>sh",
            "<cmd>Telescope find_files hidden=true<cr>",
            { desc = "Find hidden files in cwd" }
          )
          keymap.set("n", "<leader>en", function() 
            local opts = require('telescope.themes').get_ivy({
              cwd = vim.fn.stdpath("config")
            })
            require('telescope.builtin').find_files(opts)
          end)
        end,
      },
      {
        "nvim-telescope/telescope-ui-select.nvim",

        config = function()
          require("telescope").setup({
            extensions = {
              ["ui-select"] = {
                require("telescope.themes").get_dropdown({}),
              },
            },
          })
          require("telescope").load_extension("ui-select")
        end,
      },
    }
