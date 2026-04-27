-- ~/nvim/lua/slydragonn/plugins/lspconfig.lua

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		vim.lsp.inlay_hint.enable()
		vim.lsp.config("ty", {
			settings = {
				ty = {
					disableLanguageServices = false,
					diagnosticMode = "openFilesOnly",
					inlayHints = {
						-- we use basedpyright for this
						variableTypes = false,
						callArgumentNames = false,
					},
					experimental = {
						rename = false,
						autoImport = true,
					},
				},
			},
			init_options = {
				logFile = nil,
				logLevel = "info",
			},
		})
		vim.lsp.config("basedpyright", {
			enabled = true,
			settings = {
				disableOrganizeImports = false,
				basedpyright = {
					analysis = {
						-- ignore = { "*" },
						autoSearchPaths = true,
						useLibraryCodeForTypes = true,
						typeCheckingMode = "standard",
						diagnosticMode = "openFilesOnly",
						useLibraryCodeForTypes = true,
						inlayHints = {
							variableTypes = false,
							callArgumentNames = true,
							callArgumentNamesMatching = false,
							functionReturnTypes = true,
							genericTypes = false,
						},
					},
				},
			},
		})
		vim.lsp.enable("ty")
		vim.lsp.enable("basedpyright")

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)

				if not client then
					return
				end

				-- When the client is Biome, add an automatic event on
				-- save that runs Biome's "source.fixAll.biome" code action.
				-- This takes care of things like JSX props sorting and
				-- removing unused imports.
				if client.name == "biome" then
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = vim.api.nvim_create_augroup("BiomeFixAll", { clear = true }),
						callback = function()
							vim.lsp.buf.code_action({
								context = { only = { "source.fixAll.biome" }, diagnostics = {} },
								apply = true,
							})
						end,
					})
				end
			end,
		})
	end,
}
