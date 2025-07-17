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
          "pylsp",
          "rust_analyzer",
          "eslint",
          "yamlls",
          "zls",
          "tailwindcss",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Keymaps
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
      vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

      -- Lua
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
            telemetry = { enable = false },
          },
        },
      })
      lspconfig.rnix.setup({ capabilities = capabilities })
      -- Python
      lspconfig.pylsp.setup({ capabilities = capabilities })

      -- TypeScript/JavaScript
      lspconfig.ts_ls.setup({ capabilities = capabilities })
      lspconfig.eslint.setup({ capabilities = capabilities })

      -- Zig
      lspconfig.zls.setup({ capabilities = capabilities })

      -- C/C++
      lspconfig.clangd.setup({
        cmd = {
          "clangd",
        },
      })

      -- YAML
      lspconfig.yamlls.setup({ capabilities = capabilities })

      -- Tailwind
      lspconfig.tailwindcss.setup({ capabilities = capabilities })

      -- Go
      lspconfig.gopls.setup({ capabilities = capabilities })

      -- HTML/CSS
      lspconfig.html.setup({ capabilities = capabilities })
      lspconfig.cssls.setup({ capabilities = capabilities })

      -- Java
      lspconfig.jdtls.setup({ capabilities = capabilities })

      -- Vue (Volar)
      lspconfig.volar.setup({
        capabilities = capabilities,
        filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
        init_options = {
          vue = {
            hybridMode = false,
          },
        },
      })

      local vue_ts_plugin_path =
      "/Users/lenguyenkhang/.nvm/versions/node/v22.13.0/lib/node_modules/@vue/typescript-plugin"

      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = vue_ts_plugin_path,
              languages = { "javascript", "typescript", "vue" },
            },
          },
        },
        filetypes = {
          "javascript",
          "typescript",
          "vue",
        },
      })
    end,
  },
}
