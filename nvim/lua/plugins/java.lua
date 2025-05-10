return {
  "nvim-java/nvim-java",
  ft = "java", -- ⬅️ only loads when a Java file is opened
  config = function()
    require("java").setup()
    require("lspconfig").jdtls.setup({})
  end,
}
