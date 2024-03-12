return {
	"neovim/nvim-lspconfig",
	lazy = false,
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")
		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		lspconfig.yamlls.setup({
			settings = {
				yaml = {
					schemas = {
						["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
					},
				},
			},
		})

		lspconfig.jsonls.setup({
			capabilities = capabilities,
		})

		-- configure html server
		lspconfig.html.setup({
			capabilities = capabilities,
			on_attach = function(client)
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false
			end,
		})

		-- configure typescript server with plugin
		lspconfig.tsserver.setup({
			capabilities = capabilities,
		})

		-- configure css server
		lspconfig.cssls.setup({
			capabilities = capabilities,
		})
		lspconfig.cssmodules_ls.setup({
			capabilities = capabilities,
		})

		-- GLSL
		lspconfig.glsl_analyzer.setup({
			capabilities = capabilities,
		})
		lspconfig.wgsl_analyzer.setup({
			capabilities = capabilities,
		})

		-- configure tailwindcss server
		lspconfig.tailwindcss.setup({
			capabilities = capabilities,
		})

		-- configure golang server
		lspconfig.gopls.setup({
			capabilities = capabilities,
		})

		-- configure eslint server
		lspconfig.eslint.setup({
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = bufnr,
					command = "EslintFixAll",
				})
			end,
		})

		-- configure python server
		lspconfig.pyright.setup({
			capabilities = capabilities,
		})

		-- configure lua server (with special settings)
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
					hint = { enable = true },
				},
			},
		})

		-- Format on write
		vim.api.nvim_create_autocmd({ "BufWritePre" }, {
			callback = function()
				if #vim.lsp.buf_get_clients() > 0 then
					vim.lsp.buf.format()
				end
			end,
		})
	end,
}
