return {
	"nvimtools/none-ls.nvim",
	init = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- Anything not supported by mason.
			},
		})
	end,
}
