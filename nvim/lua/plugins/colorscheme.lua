  return {
    "folke/tokyonight.nvim",
    priority = 1000,
    lazy = true,
    opts = { style = "moon" },
    init = function()
      vim.cmd("colorscheme tokyonight")
    end,
  }
