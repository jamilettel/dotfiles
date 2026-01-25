-- require("lspconfig.configs").vtsls = require("vtsls").lspconfig
vim.lsp.config("vtsls", {
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
		},
	},
})
