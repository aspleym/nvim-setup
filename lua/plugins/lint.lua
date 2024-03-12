return {
	"mfussenegger/nvim-lint",
	config = function()
		require("lint").linters_by_ft = {
			javascript = { "langd" },
			javascriptreact = { "langd" },
			typescript = { "langd" },
			typescriptreact = { "langd" },
		}

		vim.api.nvim_create_autocmd({ "BufRead", "InsertLeave" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})

		require("lint").linters.langd = {
			cmd = "langd",
			stdin = true,
			args = { vim.fn.getcwd() },
			stream = "stdout",
			parser = require("lint.parser").from_pattern(
				"(%d+):(%d+):(%d+) (.*)",
				{ "lnum", "col", "end_col", "message" },
				nil,
				{
					["source"] = "langd",
					["severity"] = vim.diagnostic.severity.INFO,
				}
			),
		}
	end,
}
