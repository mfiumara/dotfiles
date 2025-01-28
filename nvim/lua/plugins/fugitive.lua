return {
	"tpope/vim-fugitive",
	init = function()
		vim.keymap.set("n", "<leader>gs", ":Git<CR>")
		vim.keymap.set("n", "<leader>gf", ":Git fetch --all<CR>")
		vim.keymap.set("n", "<leader>gl", ":Git log<CR>")
		vim.keymap.set("n", "<leader>gp", ":Git push<CR>")
		vim.keymap.set("n", "<leader>gb", ":Git checkout -b<SPACE>")
		vim.keymap.set("n", "<leader>gc", ":Git checkout<SPACE>")
		vim.keymap.set("n", "<leader>gd", ":Gdiffsplit<SPACE>")
	end,
}
