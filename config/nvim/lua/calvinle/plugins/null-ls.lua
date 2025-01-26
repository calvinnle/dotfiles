return {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local null_ls = require("null-ls")
        
        -- Setup null-ls with the desired formatters and linters
        null_ls.setup({
            sources = {
                -- Formatters
                null_ls.builtins.formatting.gofmt,          -- Go
                null_ls.builtins.formatting.rustfmt,        -- Rust
                -- null_ls.builtins.formatting.clang_format,   -- C, C++
                null_ls.builtins.formatting.black,          -- Python
                null_ls.builtins.formatting.prettier,       -- JavaScript, TypeScript

                -- Linters (optional, you can add more linters if needed)
                null_ls.builtins.diagnostics.eslint_d,      -- JavaScript, TypeScript linting
                null_ls.builtins.diagnostics.flake8,        -- Python linting
            },
            on_attach = function(client, bufnr)
                -- Format on save
                if client.server_capabilities.documentFormattingProvider then
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({ async = false })
                        end,
                    })
                end
            end,
        })
    end,
}
