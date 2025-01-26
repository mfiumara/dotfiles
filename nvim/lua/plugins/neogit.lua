return {
	"NeogitOrg/neogit",
	tag = "v0.0.1",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration

		-- Only one of these is needed.
		"nvim-telescope/telescope.nvim", -- optional
		--"ibhagwan/fzf-lua",              -- optional
		--"echasnovski/mini.pick",         -- optional
	},
	init = function()
		local neogit = require("neogit")
		neogit.setup({
			config = true,
		})
		--    vim.keymap.set('n', '<leader>gs', neogit.open)
		--    vim.keymap.set('n', '<leader>gf', neogit.action('fetch', 'fetch_all_remotes'))
		--    vim.keymap.set('n', '<leader>gl', neogit.action('log_current'))
	end,
}
