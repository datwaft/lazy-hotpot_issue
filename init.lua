-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end

-- Add lazy.nvim to rtp
vim.opt.runtimepath:prepend(lazypath)

-- Configure lazy.nvim
require("lazy").setup("conf.plugins", {
	performance = {
		cache = {
			enabled = false,
		},
	},
})

vim.cmd.colorscheme("tokyonight")
