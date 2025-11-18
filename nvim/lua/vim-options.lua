vim.cmd("set tabstop=2")
vim.cmd("set expandtab")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

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

-- only number is highlighted for cursorline
-- vim.opt.culopt = "number"
vim.opt.cursorline = true

-- for dark mod3
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "yellow" })

-- for light mod3
-- vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "red" })

-- Customize cursor appearance
vim.opt.guicursor = "n-v-c-sm:block"

vim.o.scrolloff = 8
vim.opt.swapfile = false
vim.opt.nuw = 4
vim.o.termguicolors = true
vim.opt.colorcolumn = "85"

vim.opt.showtabline = 0

-- vim.opt.signcolumn = "yes"

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- Renders spaces as "·"
-- vim.opt.list = true
-- vim.opt.listchars = vim.opt.listchars + "space:·"
