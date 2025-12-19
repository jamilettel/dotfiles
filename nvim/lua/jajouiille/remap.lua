vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { silent = true, desc = "Explore" })

vim.api.nvim_set_keymap(
	"n",
	"<C-p>",
	":lua require'telescope'.extensions.project.project{}<CR>",
	{ noremap = true, silent = true, desc = "Change project" }
)

-- buffers
vim.api.nvim_set_keymap(
	"n",
	"<leader><Left>",
	":bprevious<cr>",
	{ noremap = true, silent = true, desc = "Next buffer" }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader><Right>",
	":bnext<cr>",
	{ noremap = true, silent = true, desc = "Previous buffer" }
)

-- file
vim.api.nvim_set_keymap("n", "<leader>o", ":e %:h/", { noremap = true, silent = false, desc = "Open file in CWD" })

-- errors
vim.api.nvim_set_keymap(
	"n",
	"<leader>en",
	":lua vim.diagnostic.goto_next()<cr>",
	{ noremap = true, silent = true, desc = "Go to next error" }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>ep",
	":lua vim.diagnostic.goto_prev()<cr>",
	{ noremap = true, silent = true, desc = "Go to previous error" }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>ee",
	":lua vim.diagnostic.open_float()<cr>",
	{ noremap = true, silent = true, desc = "Show error in popup" }
)

-- lsp
vim.api.nvim_set_keymap(
	"n",
	"<M-CR>",
	":lua vim.lsp.buf.code_action()<CR>",
	{ noremap = true, silent = true, desc = "Code Action" }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>pr",
	":lua vim.lsp.buf.rename()<CR>",
	{ noremap = true, silent = true, desc = "Rename LSP" }
)

vim.keymap.set({ "i" }, "<C-l>", function()
	require("lsp_signature").toggle_float_win()
end, { silent = true, noremap = true, desc = "toggle signature" })

vim.api.nvim_set_keymap(
	"n",
	"<leader>E",
	":EslintFixAll<cr>",
	{ noremap = true, silent = true, desc = "Show error in popup" }
)

-- copy filepath / directy
vim.api.nvim_set_keymap(
	"n",
	"<leader>cr",
	':lua vim.fn.setreg("+", vim.fn.expand("%"))<cr>',

	{ noremap = true, silent = true, desc = "Copy relative filepath" }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>ca",
	':lua vim.fn.setreg("+", vim.fn.expand("%:p"))<cr>',
	{ noremap = true, silent = true, desc = "Copy absolute filepath" }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>cR",
	':lua vim.fn.setreg("+", vim.fn.expand("%:h"))<cr>',
	{ noremap = true, silent = true, desc = "Copy relative file directory" }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>cA",
	':lua vim.fn.setreg("+", vim.fn.expand("%:p:h"))<cr>',
	{ noremap = true, silent = true, desc = "Copy absolute file directory" }
)

-- git
vim.api.nvim_set_keymap(
	"n",
	"<leader>gn",
	":Gitsigns next_hunk<cr>",

	{ noremap = true, silent = true, desc = "Next hunk" }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>gp",
	":Gitsigns prev_hunk<cr>",

	{ noremap = true, silent = true, desc = "Previous hunk" }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>gg",
	":Gitsigns preview_hunk<cr>",
	{ noremap = true, silent = true, desc = "Preview hunk" }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>gb",
	":Gitsigns blame_line<cr>",
	{ noremap = true, silent = true, desc = "Blame line" }
)

vim.api.nvim_set_keymap("n", "<leader>,", ":tabnext -<cr>", { noremap = true, silent = true, desc = "Blame line" })
vim.api.nvim_set_keymap("n", "<leader>.", ":tabnext +<cr>", { noremap = true, silent = true, desc = "Blame line" })
