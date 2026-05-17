return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters = {
				clang_format = {
					args = {
						"--style={BasedOnStyle: LLVM, IndentWidth: 4, UseTab: Never}",
					},
				},
			},
			formatters_by_ft = {
				lua = { "stylua" },
				c = { "clang_format" },
				cpp = { "clang_format" },
				go = { "gofumpt" },
				html = { "prettier" },
				css = { "prettier" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				json = { "prettier" },
			},
		})

		vim.keymap.set("n", "<leader>fm", function()
			require("conform").format({ async = true })
		end, {})
	end,
}
