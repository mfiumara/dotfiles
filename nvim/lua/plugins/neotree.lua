return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- Optional, for file icons
		"MunifTanjim/nui.nvim", -- Required dependency
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		require("neo-tree").setup({
			window = {
				position = "float", -- Open as a floating window by default
			},
			filesystem = {
				follow_current_file = true, -- Optional: Focus on the current file
			},
		})

		-- Keybindings
		local map = vim.api.nvim_set_keymap
		local opts = { noremap = true, silent = true }

		-- Translate NERDTree keybindings to Neo-tree
		map("n", "<leader>nt", ":Neotree toggle reveal<CR>", opts) -- Toggles Neo-tree as a floating window
	end,
}
