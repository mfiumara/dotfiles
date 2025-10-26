-- plugins/telescope.lua:
return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
			},
			{ "nvim-tree/nvim-web-devicons", enabled = true },
			{ "nvim-telescope/telescope-ui-select.nvim" },
		},
		init = function()
			require("telescope").setup({
				defaults = {
					layout_strategy = "vertical",
				},
			})
			-- Define Key Mappings
			local map = vim.api.nvim_set_keymap
			local opts = { noremap = true, silent = true }

			map("n", "<leader>bb", "<cmd>Telescope buffers<CR>", opts)
			map("n", "<leader>?", "<cmd>TodoTelescope<CR>", opts)
			map("n", "<leader>fp", "<cmd>Telescope diagnostics<CR>", opts)
			-- Respects .gitignore
			map("n", "<C-p>", "<cmd>Telescope find_files<CR>", opts)
			-- Find all files and ignore .gitignore
			map("n", "<leader>fa", "<cmd>Telescope find_files no_ignore=true<CR>", opts)
			map("n", "<leader>ff", "<cmd>Telescope live_grep<CR>", opts)
			map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
			map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)
			map("n", "<leader>fs", "<cmd>Telescope grep_string<CR>", opts)
		end,
	},
}
