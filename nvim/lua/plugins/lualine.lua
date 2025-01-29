return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "kyazdani42/nvim-web-devicons" },
	init = function()
		require("lualine").setup()
	end,
}
