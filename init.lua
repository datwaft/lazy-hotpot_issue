-- Bootstrap lazy.nvim
local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazy_path) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazy_path,
	})
end

-- Add lazy.nvim to rtp
vim.opt.runtimepath:prepend(lazy_path)
-- Add hotpot.nvim to rtp
local hotpot_path = vim.fn.stdpath("data") .. "/lazy/hotpot.nvim"
vim.opt.runtimepath:prepend(hotpot_path)

local plugins = { "rktjmp/hotpot.nvim" }
if pcall(require, "hotpot") then
	-- Configure hotpot.nvim
	require("hotpot").setup({
		provide_require_fennel = true,
		enable_hotpot_diagnostics = false,
	})
	-- Compile plugin configurations
	for file in vim.fs.dir(vim.fn.stdpath("config") .. "/fnl/conf/plugins") do
		file = file:match("^(.*)%.fnl$")
		plugins[#plugins + 1] = require("conf.plugins." .. file)
	end
end

-- Configure lazy.nvim
require("lazy").setup(plugins, {
	performance = {
		cache = {
			enabled = false,
		},
	},
})
