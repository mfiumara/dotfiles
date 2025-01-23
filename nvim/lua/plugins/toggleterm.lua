return {
  'akinsho/toggleterm.nvim',
  init = function()
    require('toggleterm').setup {
      direction = 'float',
      insert_mapping = true,
    }
    vim.keymap.set("n", "<leader>`", "<cmd>ToggleTerm direction=float<CR>", { noremap = true, silent = true })
  end,
}

