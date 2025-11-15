return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.clang_format.with({
          extra_args = {
            "-style={ \
              BasedOnStyle: Google, \
              IndentWidth: 4, \
              AccessModifierOffset: -4}",
          },
        }),
      },
    })

    vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, {})
  end,
}
