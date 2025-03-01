-- vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- Enable line numbers
opt.relativenumber = true
opt.number = true

--- tabs & indentation
opt.tabstop = 4 -- 4 spaces for tabs (prettier default)
opt.shiftwidth = 4 -- 4 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assume you want case-sensitive

-- enable this if you want to see the cursor line
opt.cursorline = false

-- terminal colors
opt.termguicolors = true
opt.background = "dark"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- Set color column
opt.colorcolumn = "120"

-- Customize cursor appearance
opt.guicursor = "n-v-c-sm:block"
