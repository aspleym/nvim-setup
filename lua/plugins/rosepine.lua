return {
	"rose-pine/neovim",
	name = "rose-pine",
	lazy = false,
	priority = 1000,
	config = function()
		-- vim.g['zenbones_compat'] = 1
		-- vim.cmd([[colorscheme zenbones]])
		vim.cmd([[colorscheme rose-pine]])
	end,
}
