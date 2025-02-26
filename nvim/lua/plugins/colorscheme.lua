return {
	{
		"folke/tokyonight.nvim",
		opts = { style = "moon" },
		priority = 1000,
		lazy = true,
	},
	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
		lazy = true,
	},
	{
		"thesimonho/kanagawa-paper.nvim",
		priority = 1000,
		lazy = true,
		init = function()
			vim.cmd("colorscheme kanagawa-paper")
		end,
	}
}
