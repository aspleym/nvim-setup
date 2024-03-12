return {
	"zbirenbaum/copilot.lua",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			suggestion = {
				auto_trigger = true,
				keymap = {
					accept = "<M-l>",
					replace = "<M-[>",
					next = "<M-]>",
					dismiss = "<C-]>",
				},
			},
		})
	end,
}
