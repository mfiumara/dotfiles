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
			popup_border_style = "rounded",
			window = {
				position = "float",
				popup = {
					border = "rounded",
					position = "50%",
					size = {
						height = "72%",
						width = "42%",
					},
					title = function(state)
						return " Neo-tree " .. state.name:gsub("^%l", string.upper) .. " "
					end,
				},
			},
			filesystem = {
				follow_current_file = {
					enabled = true, -- Optional: Focus on the current file
				},
			},
		})

		-- Keybindings
		local map = vim.api.nvim_set_keymap
		local opts = { noremap = true, silent = true }

		-- Translate NERDTree keybindings to Neo-tree
		map("n", "<leader>nt", ":Neotree toggle float reveal<CR>", opts)
	end,
}
