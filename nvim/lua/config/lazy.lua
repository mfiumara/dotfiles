-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Set the leader key
vim.g.mapleader = ' '

-- Enable timeout for key sequences
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 10  -- Timeout length for key mappings (ms)

-- Customize fill characters for diff mode
vim.opt.fillchars:append({ diff = "╱" })

-- Enable filetype detection and related features
vim.cmd("filetype on")        -- Enable filetype detection
vim.cmd("filetype indent on") -- Enable filetype-specific indenting
vim.cmd("filetype plugin on") -- Enable filetype-specific plugins

-- Set file encoding
vim.opt.encoding = "UTF-8"

-- Set time for writing swap files and CursorHold events
vim.opt.updatetime = 100

-- Enable folding and set fold method to "indent"
vim.opt.foldenable = true
vim.opt.foldmethod = "indent"

-- Enable mouse support in all modes
vim.opt.mouse:append("a")

-- Disable Vi compatibility (use Neovim features)
vim.opt.compatible = false

-- Enable line numbers and relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Display a ruler in the command area
vim.opt.ruler = true

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "tokyonight" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
