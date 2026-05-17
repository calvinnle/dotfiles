return {
	"ej-shafran/compile-mode.nvim",
	version = "^5.0.0",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		vim.g.compile_mode = {}

		-- Keymaps
		vim.keymap.set("n", "<leader>cc", ":Compile<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>cr", ":CompileReset<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>ck", ":CompileKill<CR>", { noremap = true, silent = true })
	end,
}
