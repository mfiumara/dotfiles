return {
	"akinsho/toggleterm.nvim",
	init = function()
		require("toggleterm").setup({
			direction = "float",
			insert_mapping = true,
			float_opts = {
				border = "curved",
				height = function()
					return math.floor(vim.o.lines * 0.74)
				end,
				width = function()
					return math.floor(vim.o.columns * 0.82)
				end,
				winblend = 8,
				title_pos = "center",
			},
		})
		vim.keymap.set("n", "<leader>`", "<cmd>ToggleTerm direction=float<CR>", { noremap = true, silent = true })
	end,
}
