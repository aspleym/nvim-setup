return {
	"AckslD/swenv.nvim",
	config = function()
		require("swenv").setup({
			post_set_venv = function()
				vim.cmd("LspRestart")
			end,
		})
		vim.keymap.set(
			"n",
			"<leader>cC",
			"<cmd>lua require('swenv.api').pick_venv()<cr>",
			{ desc = "Change Python Env" }
		)
	end,
}
