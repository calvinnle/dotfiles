return {
	{ "nvim-telescope/telescope-media-files.nvim" },
	{ "nvim-lua/popup.nvim" },
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-telescope/telescope-ui-select.nvim",
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			telescope.setup({
				extensions = {
					media_files = {
						filetypes = { "png", "webp", "jpg", "jpeg" },
						find_cmd = "rg",
					},
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
				cwd = function()
					local git_root = vim.fn.system("git rev-parse --show-toplevel 2>/dev/null"):gsub("%s+", "")
					if git_root ~= "" and vim.fn.isdirectory(git_root) == 1 then
						return git_root
					end
					return vim.fn.getcwd()
				end,
				pickers = {
					colorscheme = {
						enable_preview = false,
					},
				},
				defaults = {
					devicons = {
						enable = false,
					},
					path_display = { "smart" },
					-- selection_caret = "λ",
					layout_config = {
						horizontal = {
							preview_width = 0.6,
						},
					},
					file_ignore_patterns = {
						".git",
						"node_modules",
					},
					find_command = { "rg", "--files", "--hidden" },
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
			telescope.load_extension("media_files")
			telescope.load_extension("ui-select")

			local keymap = vim.keymap

			local function get_project_root()
				local git_root = vim.fn.system("git rev-parse --show-toplevel 2>/dev/null"):gsub("%s+", "")
				if git_root ~= "" and vim.fn.isdirectory(git_root) == 1 then
					return git_root
				end
				return vim.fn.getcwd()
			end

			keymap.set("n", "<leader>sf", function()
				require("telescope.builtin").find_files({
					hidden = true,
					cwd = get_project_root(),
				})
			end, { desc = "Find files from project root" })
			keymap.set("n", "<leader>sr", "<cmd>Telescope oldfiles<cr>")
			keymap.set("n", "<leader>ss", function()
				require("telescope.builtin").live_grep({ cwd = get_project_root() })
			end, { desc = "Live grep from project root" })
			keymap.set("n", "<leader>sb", "<cmd>Telescope Buffers<cr>")
			keymap.set("n", "<leader>sc", function()
				require("telescope.builtin").grep_string({ cwd = get_project_root() })
			end, { desc = "Find string under cursor in project root" })
			keymap.set(
				"n",
				"<leader>sh",
				"<cmd>lua require('telescope.builtin').find_files({additional_args = {'--hidden'}})<cr>"
			)
			keymap.set("n", "<leader>en", function()
				local opts = require("telescope.themes").get_ivy({
					cwd = vim.fn.stdpath("config"),
				})
				require("telescope.builtin").find_files(opts)
			end)
		end,
	},
}
