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

if pcall(require, "hotpot") then
	-- Initialize hotpot
	require("hotpot").setup({
		provide_require_fennel = true,
		enable_hotpot_diagnostics = false,
	})
else
	vim.notify(
		table.concat({
			"Plugin `hotpot.nvim` could not be required.",
			"Make sure that hotpot is installed using `:Lazy`.",
			"The configuration won't be loaded.",
		}, "\n"),
		vim.log.levels.WARN
	)
end

-- Configure lazy.nvim
require("lazy").setup("conf.plugins", {
	performance = {
		cache = {
			enabled = false,
		},
	},
})

vim.cmd.colorscheme("tokyonight")
