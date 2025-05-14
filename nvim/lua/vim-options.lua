vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

-- vim.cmd("set expandtab")
-- vim.cmd("set tabstop=2")
-- vim.cmd("set softtabstop=2")
-- vim.cmd("set shiftwidth=2")

-- copy to system clipboard
vim.opt.clipboard:append("unnamedplus")

vim.cmd("set number")
vim.cmd("set relativenumber")

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Set color column
-- vim.opt.colorcolumn = "90"

vim.cmd([[
  highlight CursorLineNr guifg=yellow gui=bold
]])

vim.opt.cursorline = false

-- for dark mod3
-- vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "yellow" })

-- for light mod3
-- vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "red" })

-- Customize cursor appearance
vim.opt.guicursor = "n-v-c-sm:block"

vim.o.scrolloff = 10
vim.opt.swapfile = false
vim.opt.colorcolumn = "94"
