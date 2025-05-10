return {
  {
    "williamboman/mason.nvim",

    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",

    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",
          "cssls",
          "html",
          "gopls",
          "clangd",
          "jdtls",
          "vuels",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      -- lua
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })

      -- typescript
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })
      -- Js
      lspconfig.eslint.setup({
        capabilities = capabilities,
      })
      -- zig
      lspconfig.zls.setup({
        capabilities = capabilities,
      })

      -- c/c++
      lspconfig.clangd.setup({
        capabilities = capabilities,
      })

      -- yaml
      lspconfig.yamlls.setup({
        capabilities = capabilities,
      })
      -- tailwindcss
      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
      })
      -- golang
      lspconfig.gopls.setup({
        capabilities = capabilities,
      })

      -- python
      lspconfig.pyright.setup({ capabilities = capabilities })

      -- html
      lspconfig.html.setup({ capabilities = capabilities })

      -- css
      lspconfig.cssls.setup({ capabilities = capabilities })

      --java
      lspconfig.jdtls.setup({ capabilities = capabilities })

      -- vuels
      lspconfig.vuels.setup({ capabilities = capabilities })

      -- lsp kepmap setting
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
      vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
