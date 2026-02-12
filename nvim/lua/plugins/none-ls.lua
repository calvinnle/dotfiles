return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.clang_format.with({
					extra_args = {
						"--style={ \
                            BasedOnStyle: LLVM, \
                            UseTab: Always, \
                            IndentWidth: 8, \
                            BreakBeforeBraces: Linux, \
                            AllowShortIfStatementsOnASingleLine: false, \
                            IndentCaseLabels: false, \
                            ColumnLimit: 80, \
                            SpaceBeforeParens: ControlStatements, \
                            AlwaysBreakBeforeMultilineStrings: true, \
                            MaxEmptyLinesToKeep: 1, \
                            KeepEmptyLinesAtTheStartOfBlocks: false, \
                            PointerAlignment: Right, \
                            DerivePointerAlignment: false, \
                            BinPackParameters: true, \
                            BinPackArguments: true, \
                            SortIncludes: false \
                        }",
					},
				}),
			},
		})

		vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, {})
	end,
}
