-- plugins/telescope.lua:
return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
			},
			{ "nvim-tree/nvim-web-devicons", enabled = true },
			{ "nvim-telescope/telescope-ui-select.nvim" },
		},
		init = function()
			-- Telescope 0.1.8 still calls a few legacy nvim-treesitter APIs.
			local ok, parsers = pcall(require, "nvim-treesitter.parsers")
			if ok then
				local parser_compat = {
					ft_to_lang = function(ft)
						local language = vim.treesitter.language
						if language.get_lang then
							return language.get_lang(ft) or ft
						end
						if language.ft_to_lang then
							return language.ft_to_lang(ft) or ft
						end
						return ft
					end,
					get_parser = function(bufnr, lang)
						return vim.treesitter.get_parser(bufnr, lang)
					end,
				}
				local parser_mt = getmetatable(parsers) or {}
				local parser_index = parser_mt.__index

				parser_mt.__index = function(tbl, key)
					if parser_compat[key] then
						return parser_compat[key]
					end
					if type(parser_index) == "function" then
						return parser_index(tbl, key)
					end
					if type(parser_index) == "table" then
						return parser_index[key]
					end
				end
				setmetatable(parsers, parser_mt)
			end

			local ok_configs = pcall(require, "nvim-treesitter.configs")
			if not ok_configs then
				package.preload["nvim-treesitter.configs"] = function()
					return {
						is_enabled = function(module, lang, bufnr)
							if module ~= "highlight" or not lang then
								return false
							end

							return pcall(vim.treesitter.get_parser, bufnr, lang)
						end,
						get_module = function()
							return { additional_vim_regex_highlighting = false }
						end,
					}
				end
			end

			require("telescope").setup({
				defaults = {
					border = true,
					borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
					layout_strategy = "vertical",
					layout_config = {
						vertical = {
							height = 0.86,
							preview_height = 0.52,
							prompt_position = "top",
							width = 0.88,
						},
					},
					prompt_prefix = "> ",
					selection_caret = "  ",
					winblend = 8,
				},
			})
			-- Define Key Mappings
			local map = vim.api.nvim_set_keymap
			local opts = { noremap = true, silent = true }

			map("n", "<leader>bb", "<cmd>Telescope buffers<CR>", opts)
			map("n", "<leader>?", "<cmd>TodoTelescope<CR>", opts)
			map("n", "<leader>fp", "<cmd>Telescope diagnostics<CR>", opts)
			-- Respects .gitignore
			map("n", "<C-p>", "<cmd>Telescope find_files<CR>", opts)
			-- Find all files and ignore .gitignore
			map("n", "<leader>fa", "<cmd>Telescope find_files no_ignore=true<CR>", opts)
			map("n", "<leader>ff", "<cmd>Telescope live_grep<CR>", opts)
			map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
			map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)
			map("n", "<leader>fs", "<cmd>Telescope grep_string<CR>", opts)
		end,
	},
}
