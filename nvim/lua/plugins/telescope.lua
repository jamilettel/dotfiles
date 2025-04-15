return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.6",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-project.nvim",
    "natecraddock/telescope-zf-native.nvim",
  },
  config = function()
    require("telescope").setup({
      extensions = {
        ["zf-native"] = {
          file = {
            enable = true,
            highlight_results = true,
            match_filename = true,
            initial_sort = nil,
            smart_case = true,
          },
          generic = {
            enable = true,
            highlight_results = true,
            match_filename = false,
            initial_sort = nil,
            smart_case = true,
          },
        },
      },
    })
    require("telescope").load_extension("zf-native")

    -- set keymaps
    local keymap = vim.keymap
    local builtin = require("telescope.builtin")
    local utils = require("telescope.utils")

    keymap.set("n", "<leader>ff", function()
      builtin.find_files({ cwd = utils.buffer_dir() })
    end, {
      desc = "Fuzzy find files in buffer cwd",
    })
    keymap.set("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", {
      desc = "Fuzzy find files in cwd",
    })
    keymap.set("n", "<leader>ps", "<cmd>Telescope live_grep<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope git_status<cr>", { desc = "Find string under cursor in cwd" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope git commits<cr>", { desc = "Find todos" })
    keymap.set("n", "<leader>gr", "<cmd>Telescope lsp_references<cr>", { desc = "Find references" })
  end,
}
