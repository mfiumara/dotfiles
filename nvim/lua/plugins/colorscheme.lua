return {
	{
		"catppuccin/nvim",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				float = {
					solid = false,
					transparent = false,
				},
				custom_highlights = function(colors)
					return {
						NormalFloat = { bg = colors.mantle },
						FloatBorder = { fg = colors.lavender, bg = colors.mantle },
						FloatTitle = { fg = colors.mauve, bg = colors.mantle, style = { "bold" } },
						Pmenu = { fg = colors.text, bg = colors.mantle },
						PmenuBorder = { fg = colors.lavender, bg = colors.mantle },
						PmenuSel = { fg = colors.text, bg = colors.surface0, style = { "bold" } },
						NeoTreeFloatBorder = { link = "FloatBorder" },
						NeoTreeFloatTitle = { link = "FloatTitle" },
						TelescopeBorder = { link = "FloatBorder" },
						TelescopeTitle = { link = "FloatTitle" },
					}
				end,
			})

			vim.cmd("colorscheme catppuccin-mocha")
		end,
	},
}
