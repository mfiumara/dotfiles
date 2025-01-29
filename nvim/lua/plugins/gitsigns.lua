return {
	"lewis6991/gitsigns.nvim",
	init = function()
		require("gitsigns").setup({
			signs = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "|" },
				topdelete = { text = "|" },
				changedelete = { text = "|" },
			},
			current_line_blame = true,
		})
		vim.keymap.set("n", "<leader>gd", ":Gitsigns diffthis<CR>")
		vim.keymap.set("n", "<leader>gb", ":Gitsigns blame<CR>")
	end,
}
