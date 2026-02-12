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
			defaults = {
				hidden = true,
				-- path_display = {
				-- 	"smart",
				-- },
				layout_strategy = "vertical",
				layout_config = { prompt_position = "bottom", height = 0.95, width = 0.99 },
				fname_width = 100,
			},
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

		keymap.set("n", "<leader>ps", function()
			builtin.live_grep({ fname_width = 100 })
		end, { desc = "Grep whole project" })

		keymap.set("n", "<leader>pS", function()
			builtin.live_grep({ fname_width = 100, cwd = utils.buffer_dir() })
		end, { desc = "Grep cwd" })

		keymap.set("n", "<leader>pq", function()
			builtin.quickfix({ fname_width = 100 })
		end, { desc = "Quickfix" })

		keymap.set("n", "<leader>fb", function()
			builtin.buffers({ fname_width = 100 })
		end, { desc = "Find string in cwd" })

		keymap.set("n", "<leader>fs", function()
			builtin.git_status({ fname_width = 100 })
		end, { desc = "Find string under cursor in cwd" })

		keymap.set("n", "<leader>[", function()
			builtin.lsp_references({ fname_width = 100 })
		end, { desc = "Find references" })

		keymap.set("n", "<leader>r", function()
			builtin.resume({ fname_width = 100 })
		end, { desc = "Telescope resume" })
	end,
}
