return {
    "folke/snacks.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        local snacks = require("snacks")

        snacks.setup({
            notifier = { enabled = true },
            -- words = { enabled = true },
            lazygit = {
                configure = false,
                win = {
                    position = "float",
                    width = 0.99,
                    height = 0.99,
                },
            },
            terminal = {
                win = {
                    position = "right",
                    width = 0.5,
                    wo = {
                        winbar = "", -- hide terminal title
                    },
                },
            },
            picker = {
                formatters = {
                    file = {
                        filename_first = true,
                    },
                },
                prompt = "   ",
            },
        })

        -- Keymaps
        local map = vim.keymap.set
        map("n", "<leader>fs", function() snacks.picker.smart() end, {})
        map("n", "<leader>ff", function() snacks.picker.files({ hidden = true }) end, {})
        map("n", "<leader>fr", function() snacks.picker.recent() end, {})
        map("n", "<leader>fs", function() snacks.picker.grep() end, {})
        map("n", "<leader>fc", function() snacks.picker.grep_word() end, { desc = "Find word under cursor in CWD" })
        map("n", "<leader><leader>", function() snacks.picker.buffers({ layout = { preset = "select" } }) end,
            { desc = "Fuzzy find buffers" })
        map("n", "<leader>ft", function() snacks.picker() end, { desc = "Other pickers..." })
        map("n", "<leader>fh", function() snacks.picker.help() end, { desc = "Find help tags" })
        map("n", "<leader>fS", function() require("pick-resession").pick() end, { desc = "Find Session" })
    end,
}
