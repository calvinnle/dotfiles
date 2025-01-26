local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ { import = "calvinle.plugins" }, { import = "calvinle.plugins.lsp" } }, {
    checker = {
        enabled = false,
        notify = false,
    },
	spec = {
		{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
	},
	install = { colorscheme = { "catppuccin" } },
    change_detection = {
        notify = false,
    },
})
vim.g.autoformat = false

