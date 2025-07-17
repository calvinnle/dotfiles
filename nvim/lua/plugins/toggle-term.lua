return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup({
			open_mapping = [[<c-\>]], -- Toggle terminal with Ctrl+\
			direction = "horizontal", -- Default direction for terminals
			float_opts = {
				border = "rounded", -- Rounded border for floating terminals
				width = 88,
				height = 22,
			},
			shade_terminals = true, -- Enable shading for terminal backgrounds
			shading_factor = -50, -- Negative value to darken terminal
		})

		local keymap = vim.keymap -- Convenience alias for key mapping

		-- Normal mode key mappings
		keymap.set("n", "<leader>th", ":ToggleTerm 1 direction=horizontal<CR>")
		keymap.set("n", "<leader>t2", ":ToggleTerm 2 direction=horizontal<CR>")
		keymap.set("n", "<leader>t3", ":ToggleTerm 3 direction=horizontal<CR>")
		keymap.set("n", "<leader>tv", ":ToggleTerm v direction=vertical<CR>")
		keymap.set("n", "<leader>tf", ":ToggleTerm direction=float<CR>")

		-- Enable window navigation in terminal mode
		keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]])
		keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]])
		keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]])
		keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]])

		-- -- Escape key to close terminal in terminal mode
		-- vim.cmd([[
		--         autocmd TermOpen * tnoremap <buffer> <Esc> <C-\><C-n>:q<CR>
		--       ]])
		--
		-- Set terminal background color to a darker shade
		vim.cmd("highlight ToggleTerm guibg=#1e1e1e")
	end,
}
