-- require("lspconfig.configs").vtsls = require("vtsls").lspconfig
vim.lsp.config("vtsls", {
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
	settings = {
		javascript = {
			preferences = {
				importModuleSpecifier = "non-relative",
			},
			updateImportsOnFileMove = "always",
		},
		typescript = {
			preferences = {
				importModuleSpecifier = "non-relative",
			},
			updateImportsOnFileMove = "always",
			inlayHints = {
				parameterNames = { enabled = "literals" },
				parameterTypes = { enabled = true },
				variableTypes = { enabled = true },
				propertyDeclarationTypes = { enabled = true },
				functionLikeReturnTypes = { enabled = true },
				enumMemberValues = { enabled = true },
			},
		},
		vtsls = {
			enableMoveToFileCodeAction = true,
			tsserver = {
				globalPlugins = {
					{
						name = "@vue/typescript-plugin",
						languages = { "vue" },
						configNamespace = "typescript",
						enableForWorkspaceTypeScriptVersions = true,
						location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
					},
				},
			},
		},
		-- on_attach = function()
		-- 	vim.lsp.enable({ "vue_ls" })
		-- end,
	},
})
-- vim.lsp.enable({ "vtsls" })
