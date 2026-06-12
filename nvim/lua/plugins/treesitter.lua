local languages = { "c", "lua", "rust" }
local install_dir = vim.fn.stdpath("data") .. "/lazy/nvim-treesitter"

return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = function()
			local treesitter = require("nvim-treesitter")

			treesitter.setup({ install_dir = install_dir })
			treesitter.install(languages):wait(300000)
			treesitter.update(languages):wait(300000)
		end,
		config = function()
			local treesitter = require("nvim-treesitter")

			treesitter.setup({ install_dir = install_dir })
			treesitter.install(languages)

			vim.api.nvim_create_autocmd("FileType", {
				pattern = languages,
				callback = function(args)
					pcall(vim.treesitter.start, args.buf)
					vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end,
	},
}
