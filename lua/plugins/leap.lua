return {
	"ggandor/leap.nvim",
	config = function()
		vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward-to)")
		vim.keymap.set({ "n" }, "S", "<Plug>(leap-backward-to)")
		require("leap").add_repeat_mappings("<tab>", "<s-tab>", {
			relative_directions = true,
			modes = { "n", "x", "o" },
		})
	end,
}
