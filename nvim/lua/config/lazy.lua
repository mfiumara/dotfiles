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

-- Keymaps
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Redraw screen
keymap("n", "<leader>rr", ":redraw<CR>", opts)

-- Quickfix list
keymap("n", "<leader>qo", ":copen<CR>", opts)
keymap("n", "<leader>qc", ":cclose<CR>", opts)
keymap("n", "<leader>qn", ":cnext<CR>", opts)
keymap("n", "<leader>qp", ":cprev<CR>", opts)
keymap("n", "<leader>qt", ":cfirst<CR>", opts)
keymap("n", "<leader>ql", ":clast<CR>", opts)

-- Location list
keymap("n", "<leader>lo", ":lopen<CR>", opts)
keymap("n", "<leader>lc", ":lclose<CR>", opts)
keymap("n", "<leader>ln", ":lnext<CR>", opts)
keymap("n", "<leader>lp", ":lprev<CR>", opts)
keymap("n", "<leader>lt", ":lfirst<CR>", opts)
keymap("n", "<leader>ll", ":llast<CR>", opts)

-- Spacemacs-like window management
keymap("n", "<leader>wj", ":wincmd j<CR>", opts)
keymap("n", "<leader>wk", ":wincmd k<CR>", opts)
keymap("n", "<leader>wh", ":wincmd h<CR>", opts)
keymap("n", "<leader>wl", ":wincmd l<CR>", opts)
keymap("n", "<leader>wr", ":wincmd r<CR>", opts)
keymap("n", "<leader>+", ":res +5<CR>", opts)
keymap("n", "<leader>_", ":res -5<CR>", opts)
keymap("n", "<leader>wo", ":on<CR>", opts)
keymap("n", "<leader>wd", ":q<CR>", opts)
keymap("n", "<leader>sv", ":vsplit<CR>", opts)
keymap("n", "<leader>sh", ":split<CR>", opts)

-- Buffer management
keymap("n", "<leader>bn", ":bnext<CR>", opts)
keymap("n", "<leader>bp", ":bprevious<CR>", opts)
keymap("n", "<leader>bd", ":bdelete<CR>", opts)
keymap("n", "<leader>br", ":file<CR>", opts)

-- Tab management
keymap("n", "<leader>tl", ":tabnext<CR>", opts)
keymap("n", "<leader>th", ":tabprevious<CR>", opts)
keymap("n", "<leader>tn", ":tabnew<CR>", opts)
keymap("n", "<leader>td", ":tabclose<CR>", opts)
keymap("n", "<leader>tt", ":tabedit %<CR>", opts)

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
