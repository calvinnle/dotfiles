-- Indentation
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.o.background = "light"

-- Clipboard
vim.opt.clipboard:append("unnamedplus")

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Visual block move mappings
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Cursor line
vim.opt.cursorline = false
vim.opt.cursorlineopt = "number"
-- vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffdd33" })
-- vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "red" })

-- Cursor appearance
vim.opt.guicursor = "n-v-c-sm:block-blinkwait300-blinkon200-blinkoff150"

-- Misc
vim.opt.scrolloff = 8
vim.opt.swapfile = false
vim.o.termguicolors = true
vim.opt.colorcolumn = "80"

-- Netrw
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- status bar
vim.o.showtabline = 0
-- vim.o.laststatus = 0

-- here are some comments using emacs

-- minor visual changes to panes
-- vim.opt.fillchars = { vert = " ", horiz = " ", horizup = " ", horizdown = " ", vertleft = " ", vertright = " ", verthoriz = " " }

-- Renders spaces as "·"
-- vim.opt.list = true
-- vim.opt.listchars = vim.opt.listchars + "space:·"
--
vim.cmd("noh")
-- Add to your init.lua
vim.api.nvim_set_hl(0, "MatchParen", { link = "Normal" })  -- Make it invisible
-- OR disable completely
vim.o.showmatch = false
vim.o.matchpairs = ""  -- Clear all matching pairs
