return {
	"nvimdev/indentmini.nvim",
	config = function()
		require("indentmini").setup()

		vim.cmd.highlight("IndentLine guifg=#444444")
		vim.cmd.highlight("IndentLineCurrent guifg=#9C5E59")
	end,
}
