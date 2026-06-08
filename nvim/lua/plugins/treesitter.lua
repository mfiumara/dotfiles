return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSInstall c lua rust",
		config = function()
			local languages = { "c", "lua", "rust" }

			vim.api.nvim_create_autocmd("FileType", {
				pattern = languages,
				callback = function()
					vim.treesitter.start()
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end,
	},
}
