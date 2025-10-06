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

vim.keymap.set({ "n" }, "<C-k>", function()
  require("lsp_signature").toggle_float_win()
end, { silent = true, noremap = true, desc = "toggle signature" })
