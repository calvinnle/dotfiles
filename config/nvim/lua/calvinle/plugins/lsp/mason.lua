return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local lspconfig = require("lspconfig")

        -- Mason setup
        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        -- Ensure these servers are installed
        mason_lspconfig.setup({
            ensure_installed = {
                "gopls",          -- Go
                "rust_analyzer",  -- Rust
                "clangd",         -- C, C++
                "pyright",        -- Python
                "ts_ls", -- JavaScript and TypeScript
                "eslint",         -- JavaScript/TypeScript linting
            },
        })

        -- LSP server setup
        local servers = {
            gopls = {},
            rust_analyzer = {},
            clangd = {},
            pyright = {},
            ["ts_ls"] = {
                settings = {
                    javascript = {
                        format = { enable = true },
                    },
                    typescript = {
                        format = { enable = true },
                    },
                },
            },
            eslint = {},
        }

        for server, config in pairs(servers) do
            lspconfig[server].setup(config)
        end
    end,
}
