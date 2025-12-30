return {
	"nvimdev/indentmini.nvim",
	config = function()
		require("indentmini").setup()

		vim.cmd.highlight("IndentLine guifg=#444444")
		vim.cmd.highlight("IndentLineCurrent guifg=#9C5E59")
	end,
}
-- return {
--   "shellRaining/hlchunk.nvim",
--   event = { "BufReadPre", "BufNewFile" },
--   config = function()
--     require("hlchunk").setup({
--
--       chunk = {
--         enable = true,
--         use_treesitter = true,
--       },
--       indent = {
--         use_treesitter = true,
--         enable = true,
--       },
--     })
--   end,
-- }
