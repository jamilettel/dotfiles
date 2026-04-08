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
	end,
}
