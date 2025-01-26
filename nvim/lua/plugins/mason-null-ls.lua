return {
	"jay-babu/mason-null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"nvimtools/none-ls.nvim",
	},
	init = function()
		require("mason").setup()
		require("mason-null-ls").setup({
			ensure_installed = {
				"clang-format",
				"clangd",
				"cortex-debug",
				"lua-language-server",
				"pyright",
				"rust-analyzer",
				"stylua",
			},
			automatic_installation = false,
			handlers = {},
		})
		require("null-ls").setup({
			sources = {
				-- Anything not supported by mason.
			},
		})
	end,
}
