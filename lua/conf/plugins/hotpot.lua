local function config()
	-- Initialize hotpot
	require("hotpot").setup({
		provide_require_fennel = true,
		enable_hotpot_diagnostics = false,
	})
	-- Compile plugin configurations
	-- This is required because Lazy requires in some way those plugins and
	-- hotpot doesn't detect that they have been required
	for file in vim.fs.dir(vim.fn.stdpath("config") .. "/fnl/conf/plugins") do
		file = file:match("^(.*)%.fnl$")
		require("conf.plugins." .. file)
	end
end

return {
	"rktjmp/hotpot.nvim",
	config = config,
}
