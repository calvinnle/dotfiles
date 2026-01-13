return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup({
			open_mapping = [[<c-\>]],
			direction = "horizontal",
			float_opts = {
				border = "rounded",
				width = 88,
				height = 22,
			},
			shade_terminals = true,
			shading_factor = -50,
			terminal_mappings = false,
			persist_mode = true,
		})

		local keymap = vim.keymap

		-- Normal mode key mappings
		keymap.set("n", "<leader>th", ":ToggleTerm 1 direction=horizontal<CR>")
		keymap.set("n", "<leader>t2", ":ToggleTerm 2 direction=horizontal<CR>")
		keymap.set("n", "<leader>t3", ":ToggleTerm 3 direction=horizontal<CR>")
		keymap.set("n", "<leader>tv", ":ToggleTerm v direction=vertical<CR>")
		keymap.set("n", "<leader>tf", ":ToggleTerm direction=float<CR>")

		-- Exit terminal mode mappings
		keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]])
		keymap.set("t", "<A-`>", [[<C-\><C-n>]])
		keymap.set("t", "<C-]>", [[<C-\><C-n>]])

		-- Window navigation
		keymap.set("t", "<A-h>", [[<C-\><C-n><C-w>h]])
		keymap.set("t", "<A-j>", [[<C-\><C-n><C-w>j]])
		keymap.set("t", "<A-k>", [[<C-\><C-n><C-w>k]])
		keymap.set("t", "<A-l>", [[<C-\><C-n><C-w>l]])

		-- Buffer-specific mappings
		vim.api.nvim_create_autocmd("TermOpen", {
			pattern = "*",
			callback = function()
				local opts = { buffer = 0 }

				-- Window navigation
				vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], opts)
				vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], opts)
				vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], opts)
				vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], opts)

				-- Quick exit
				vim.keymap.set("t", "<C-q>", [[<C-\><C-n>]], opts)
				vim.keymap.set("t", "<C-x>", [[<C-\><C-n>]], opts)
				vim.keymap.set("t", "<F1>", [[<C-\><C-n>]], opts)

				-- Preserve <Esc> for zsh
				vim.keymap.set("t", "<Esc>", "<Esc>", opts)

				-- ENABLE RELATIVE LINE NUMBERS
				-- vim.opt_local.relativenumber = true
				-- vim.opt_local.number = true 
			end,
		})

		-- Also set when entering terminal normal mode
		vim.api.nvim_create_autocmd("TermEnter", {
			pattern = "*",
			callback = function()
				-- vim.opt_local.relativenumber = true
				-- vim.opt_local.number = true
			end,
		})

		-- Quick toggle mapping
		keymap.set({ "n", "t", "i" }, "<C-\\>", function()
			require("toggleterm").toggle()
		end)

		-- Quick hide mapping
		keymap.set("n", "<leader>ts", function()
			require("toggleterm").toggle()
		end)
	end,
}
