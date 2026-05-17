local keymap = vim.keymap

-- window management
keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>wh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>we", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>wc", "<cmd>close<CR>", { desc = "Close current split" })

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })

vim.keymap.set("n", "=", [[<cmd>vertical resize +5<cr>]])
vim.keymap.set("n", "-", [[<cmd>vertical resize -5<cr>]])
vim.keymap.set("n", "+", [[<cmd>horizontal resize +2<cr>]])
vim.keymap.set("n", "_", [[<cmd>horizontal resize -2<cr>]])

vim.keymap.set("n", "<leader>r", function()
	vim.cmd("source /Users/lenguyenkhang/.config/nvim/lua/vim-options.lua")
	vim.cmd("source /Users/lenguyenkhang/.config/nvim/init.lua")
	vim.cmd("source /Users/lenguyenkhang/.config/nvim/lua/vim-keymaps.lua")

	-- Source all ftplugin files
	local ftplugin_dir = "/Users/lenguyenkhang/.config/nvim/after/ftplugins"
	if vim.fn.isdirectory(ftplugin_dir) == 1 then
		local files = vim.fn.globpath(ftplugin_dir, "*.lua", false, true)
		for _, file in ipairs(files) do
			vim.cmd("source " .. file)
		end
		print(string.format("Config reloaded (%d ftplugins sourced)", #files))
	else
		print("Config reloaded (no ftplugins found)")
	end
end)
