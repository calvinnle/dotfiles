return {
  "romgrk/barbar.nvim",
  version = "^1.0.0",

  dependencies = {
    "lewis6991/gitsigns.nvim",     -- OPTIONAL: for git status
    "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
  },

  init = function()
    vim.g.barbar_auto_setup = false -- disable auto-setup, we'll call setup() manually
  end,

  config = function()
    require("barbar").setup({
      icons = {
        enabled = true,

        buffer_index = false,
        buffer_number = false,
        button = "",
        diagnostics = {
          [vim.diagnostic.severity.ERROR] = { enabled = true, icon = "ﬀ" },
          [vim.diagnostic.severity.WARN] = { enabled = false },
          [vim.diagnostic.severity.INFO] = { enabled = false },
          [vim.diagnostic.severity.HINT] = { enabled = true },
        },
        gitsigns = {
          added = { enabled = true, icon = "+" },
          changed = { enabled = true, icon = "~" },
          deleted = { enabled = true, icon = "-" },
        },
        filetype = {
          custom_colors = false,
          enabled = true,
        },
        separator = { left = "▎", right = "" },
        separator_at_end = true,
        modified = { button = "●" },
        pinned = { button = "", filename = true },
        preset = "default",
        alternate = { filetype = { enabled = false } },
        current = { buffer_index = true },
        inactive = { button = "×" },
        visible = { modified = { buffer_number = false } },
      },

      sidebar_filetypes = {
        NvimTree = true,
        undotree = { text = "undotree", align = "center" },
        ["neo-tree"] = { event = "BufWipeout" },
        Outline = { event = "BufWinLeave", text = "symbols-outline", align = "right" },
      },

      letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",

      no_name_title = nil,

      sort = {
        ignore_case = true,
      },
    })

    -- Keymaps
    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    map("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)
    map("n", "<C-s-p>", "<Cmd>BufferPickDelete<CR>", opts)

    map("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
    map("n", "<Space>bn", "<Cmd>BufferOrderByName<CR>", opts)
    map("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
    map("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
    map("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)
    map("n", "<leader>tx", "<Cmd>BufferClose<CR>", opts)
  end,
}
