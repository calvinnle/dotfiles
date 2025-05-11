return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },

  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- Diagnostics
        null_ls.builtins.diagnostics.eslint,

        -- Formatters
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.prettier.with({
          extra_args = { "--tab-width", "4" },
        }),

        null_ls.builtins.formatting.clang_format.with({
          extra_args = {
            "--style={IndentWidth: 4, TabWidth: 4, UseTab: Never}",
          },
        }),

        null_ls.builtins.formatting.gofumpt,
      },
    })

    vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format)
  end,
}
