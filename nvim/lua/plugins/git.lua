return {
	{
		"tpope/vim-fugitive",
		init = function()
			vim.keymap.set("n", "<leader>gs", ":Git<CR>")
			vim.keymap.set("n", "<leader>gf", ":Git fetch --all<CR>")
			vim.keymap.set("n", "<leader>gl", ":Git log<CR>")
			vim.keymap.set("n", "<leader>gp", ":Git push<CR>")
			vim.keymap.set("n", "<leader>gb", ":Git checkout -b<SPACE>")
			vim.keymap.set("n", "<leader>gc", ":Git checkout<SPACE>")
			-- vim.keymap.set("n", "<leader>gd", ":Gdiffsplit<SPACE>")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		init = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "│" },
					change = { text = "│" },
					delete = { text = "│"},
					topdelete = { text = "│" },
					changedelete = { text = "│" },
				},
				current_line_blame = true,
			})
			vim.keymap.set("n", "<leader>gd", ":Gitsigns diffthis<CR>")
			vim.keymap.set("n", "<leader>gb", ":Gitsigns blame<CR>")
			vim.keymap.set("n", "<leader>gd", ":Gitsigns diffthis<CR>")
		end,
	},
}
