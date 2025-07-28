return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<c-\>]], -- Toggle terminal with Ctrl+\
      direction = "horizontal", -- Default direction for terminals
      float_opts = {
        border = "rounded",  -- Rounded border for floating terminals
        width = 88,
        height = 22,
      },
      shade_terminals = true, -- Enable shading for terminal backgrounds
      shading_factor = -50, -- Negative value to darken terminal
    })
    local keymap = vim.keymap -- Convenience alias for key mapping
    -- Normal mode key mappings
    keymap.set("n", "<leader>th", ":ToggleTerm 1 direction=horizontal<CR>")
    keymap.set("n", "<leader>t2", ":ToggleTerm 2 direction=horizontal<CR>")
    keymap.set("n", "<leader>t3", ":ToggleTerm 3 direction=horizontal<CR>")
    keymap.set("n", "<leader>tv", ":ToggleTerm v direction=vertical<CR>")
    keymap.set("n", "<leader>tf", ":ToggleTerm direction=float<CR>")

    -- Exit terminal mode without closing terminal
    keymap.set("t", "<C-\\><C-n>", [[<C-\><C-n>]])

    -- Enable window navigation in terminal mode using Alt keys to avoid tmux conflicts
    keymap.set("t", "<A-h>", [[<C-\><C-n><C-w>h]])
    keymap.set("t", "<A-j>", [[<C-\><C-n><C-w>j]])
    keymap.set("t", "<A-k>", [[<C-\><C-n><C-w>k]])
    keymap.set("t", "<A-l>", [[<C-\><C-n><C-w>l]])

    -- Alternative: Use Ctrl keys with buffer-specific override to prevent tmux conflicts
    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "*",
      callback = function()
        local opts = { buffer = 0 }
        -- Override any tmux navigator keymaps in terminal buffers
        vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], opts)
        vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], opts)
        vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], opts)
        vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], opts)
      end,
    })

    -- Set terminal background color to a darker shade
    vim.cmd("highlight ToggleTerm guibg=#1e1e1e")
  end,
}
