require("config.lazy")
require("vim-options")
require("vim-keymaps")

-- Enable statusline
vim.opt.laststatus = 2

-- Build statusline
local statusline = {}

-- Left section
statusline[#statusline + 1] = "%#StatusLine#"
statusline[#statusline + 1] = " %{toupper(mode())}"  -- Mode
statusline[#statusline + 1] = " %f"                  -- File path
statusline[#statusline + 1] = " %m"                  -- Modified flag
statusline[#statusline + 1] = " %r"                  -- Readonly flag

-- Middle section (separator)
statusline[#statusline + 1] = "%="

-- Right section
statusline[#statusline + 1] = "%y"                   -- File type
statusline[#statusline + 1] = " [%{&fileencoding}]"  -- Encoding
statusline[#statusline + 1] = " %l:%c"               -- Line:Column
statusline[#statusline + 1] = " %p%%"                -- Percentage

-- Set the statusline
vim.opt.statusline = table.concat(statusline, "")

-- Set highlight groups
vim.api.nvim_set_hl(0, "StatusLine", { bg = "#d3d3d3", fg = "#000000" })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#d3d3d3", fg = "#666666" })
-- vim.cmd("colorscheme solarized")

-- -- Tmux horizontal split mapping
-- vim.keymap.set("n", "<leader>th", function()
--     vim.fn.system("tmux split-window -v")
-- end, { silent = true, desc = "Tmux horizontal split" })
--
-- -- Tmux vertical split mapping
-- vim.keymap.set("n", "<leader>tv", function()
--     vim.fn.system("tmux split-window -h")
-- end, { silent = true, desc = "Tmux vertical split" })
--

-- Function to toggle a horizontal terminal at the bottom
-- Persistent terminal buffer ID

-- local smart_term = {
-- 	bufnr = nil,
-- 	winid = nil,
-- }
--
-- function _G.toggle_horizontal_term()
-- 	-- If window is open, hide it (preserve buffer and session)
-- 	if smart_term.winid and vim.api.nvim_win_is_valid(smart_term.winid) then
-- 		vim.api.nvim_win_hide(smart_term.winid)
-- 		smart_term.winid = nil
-- 		return
-- 	end
--
-- 	-- If buffer exists, reuse it
-- 	if smart_term.bufnr and vim.api.nvim_buf_is_valid(smart_term.bufnr) then
-- 		vim.cmd("belowright split")
-- 		vim.cmd("resize 15")
-- 		smart_term.winid = vim.api.nvim_get_current_win()
-- 		vim.api.nvim_win_set_buf(smart_term.winid, smart_term.bufnr)
-- 	else
-- 		-- Create a new terminal buffer
-- 		vim.cmd("belowright split")
-- 		vim.cmd("resize 10")
-- 		vim.cmd("terminal")
-- 		smart_term.winid = vim.api.nvim_get_current_win()
-- 		smart_term.bufnr = vim.api.nvim_get_current_buf()
-- 	end
--
-- 	-- Enter insert mode
-- 	vim.cmd("startinsert")
--
-- 	-- Enable relative line numbers
-- 	vim.wo.number = true
-- 	vim.wo.relativenumber = true
-- end
--
-- -- Keymap to toggle persistent terminal
-- vim.keymap.set("n", "<leader>th", toggle_horizontal_term, { desc = "Toggle persistent horizontal terminal" })
--
-- -- Optional: Better terminal navigation and escape
-- vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
--
-- -- Persistent terminal state for vertical terminal
-- local smart_vterm = {
-- 	bufnr = nil,
-- 	winid = nil,
-- }
--
-- function _G.toggle_vertical_term()
-- 	-- If window is open, hide it
-- 	if smart_vterm.winid and vim.api.nvim_win_is_valid(smart_vterm.winid) then
-- 		vim.api.nvim_win_hide(smart_vterm.winid)
-- 		smart_vterm.winid = nil
-- 		return
-- 	end
--
-- 	-- If buffer exists, reuse it
-- 	if smart_vterm.bufnr and vim.api.nvim_buf_is_valid(smart_vterm.bufnr) then
-- 		vim.cmd("vsplit")
-- 		vim.cmd("vertical resize " .. math.floor(vim.o.columns / 2))
-- 		smart_vterm.winid = vim.api.nvim_get_current_win()
-- 		vim.api.nvim_win_set_buf(smart_vterm.winid, smart_vterm.bufnr)
-- 	else
-- 		-- Create new terminal buffer
-- 		vim.cmd("vsplit")
-- 		vim.cmd("vertical resize " .. math.floor(vim.o.columns / 2))
-- 		vim.cmd("terminal")
-- 		smart_vterm.winid = vim.api.nvim_get_current_win()
-- 		smart_vterm.bufnr = vim.api.nvim_get_current_buf()
-- 	end
--
-- 	vim.cmd("startinsert")
--
-- 	-- Enable relative line numbers
-- 	vim.wo.number = true
-- 	vim.wo.relativenumber = true
-- end
--
-- -- Keymap to toggle vertical terminal
-- vim.keymap.set("n", "<leader>tv", toggle_vertical_term, { desc = "Toggle persistent vertical terminal" })
