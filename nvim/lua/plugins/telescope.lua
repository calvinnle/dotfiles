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
				extensions = {
					media_files = {
						-- filetypes whitelist
						-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
						filetypes = { "png", "webp", "jpg", "jpeg" },
						-- find command (defaults to `fd`)
						find_cmd = "rg",
					},
				},
				-- Always search from project root, not current file directory
				cwd = function()
					local git_root = vim.fn.system("git rev-parse --show-toplevel 2>/dev/null"):gsub("%s+", "")
					if git_root ~= "" and vim.fn.isdirectory(git_root) == 1 then
						return git_root
					end
					return vim.fn.getcwd()
				end,
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

			-- Helper function to get project root
			local function get_project_root()
				local git_root = vim.fn.system("git rev-parse --show-toplevel 2>/dev/null"):gsub("%s+", "")
				if git_root ~= "" and vim.fn.isdirectory(git_root) == 1 then
					return git_root
				end
				return vim.fn.getcwd()
			end

			keymap.set("n", "<leader>sf", function()
				require("telescope.builtin").find_files({ hidden = true, cwd = get_project_root() })
			end, { desc = "Find files from project root" })
			keymap.set("n", "<leader>sr", "<cmd>Telescope oldfiles<cr>")
			keymap.set("n", "<leader>ss", function()
				require("telescope.builtin").live_grep({ cwd = get_project_root() })
			end, { desc = "Live grep from project root" })
			keymap.set("n", "<leader>sb", "<cmd>Telescope Buffers<cr>")
			keymap.set(
				"n",
				"<leader>sc",
				function()
					require("telescope.builtin").grep_string({ cwd = get_project_root() })
				end,
				{ desc = "Find string under cursor in project root" }
			)
			keymap.set(
				"n",
				"<leader>sh",
				function()
					require("telescope.builtin").find_files({ hidden = true, cwd = get_project_root() })
				end,
				{ desc = "Find hidden files from project root" }
			)
			keymap.set("n", "<leader>en", function()
				local opts = require("telescope.themes").get_ivy({
					cwd = vim.fn.stdpath("config"),
				})
				require("telescope.builtin").find_files(opts)
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
