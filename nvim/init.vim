nnoremap <SPACE> <Nop>
let mapleader = " "

set ttimeout
set ttimeoutlen=10

filetype on
filetype indent on
filetype plugin on

set encoding=UTF-8
set updatetime=100

set mouse+=a
set nocompatible
" syntax on
set number relativenumber
set ruler

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
"
" VISUALS
"
" Status lines
" Plug 'akinsho/bufferline.nvim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-lualine/lualine.nvim'

" File trees
" Plug 'preservim/nerdtree' |
"             \ Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kyazdani42/nvim-tree.lua'

" Mini-map
Plug 'wfxr/minimap.vim', {'do': ':!cargo install --locked code-minimap'}

" Themes
Plug 'joshdick/onedark.vim'
" Plug 'rebelot/kanagawa.nvim'

" Icons
" Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)

" Nice tabs
Plug 'romgrk/barbar.nvim'

" Syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Terminal stuff
Plug 'akinsho/toggleterm.nvim', {'tag' : 'v2.*'}

" Git plugins
" Handled by VGit
" Plug 'airblade/vim-gitgutter'
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'
" Plug 'tanvirtin/vgit.nvim'
" Plug 'TimUntersberger/neogit'

" Search
"Plug 'ctrlpvim/ctrlp.vim'
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

" LANGUAGES
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" CoC language extensions
Plug 'neoclide/coc-json'
Plug 'josa42/coc-go'
Plug 'fannheyward/coc-rust-analyzer'
" CocInstall coc-go
" CocInstall coc-markdownlint

Plug 'SirVer/ultisnips', { 'do': ':!pip3 install neovim' }
Plug 'tpope/vim-commentary'

Plug 'fatih/vim-go', { 'do': 'GoInstallBinaries' }
" Linter
Plug 'sbdchd/neoformat'

call plug#end()

" local neogit = require('neogit')
" neogit.setup {}
" require("toggleterm").setup{}

lua << EOF
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- empty setup using defaults
require('nvim-treesitter.configs').setup {
	ensure_installed = { "c", "lua", "rust" },
}
 
require('nvim-tree').setup {
 	renderer = { highlight_git = true, icons = { show = { folder = false }, git_placement = "signcolumn",	
		glyphs = {
			git = {	unstaged = "M",	staged = "S", unmerged = "", renamed = "R", untracked = "*", deleted = "D", ignored = "i" },
		},
		},
	},
	view = { 
		float = {
			enable = true, 
			open_win_config = {
				relative = "editor",
				border = "rounded",
				width = 30,
				height = 30,
				row = 1,
				col = 3,
			},
		},
	},
}

require('lualine').setup()
require('gitsigns').setup {
	signs = {
		add = {hl = 'GitSignsAdd', text = '│', numhl='GitSignsAddNr', linehl='GitSignsAddLn'},
		change = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
		delete = {hl = 'GitSignsDelete', text = '|', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
		topdelete = {hl = 'GitSignsDelete', text = '|', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
		changedelete = {hl = 'GitSignsChange', text = '|', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'}
	}
}
require('telescope').setup{
  defaults = {
    layout_strategy = 'vertical',
  },
}

local nvim_tree_events = require('nvim-tree.events')
local bufferline_state = require('bufferline.state')

-- local function get_tree_size()
--   return require'nvim-tree.view'.View.width
-- end
-- 
-- nvim_tree_events.subscribe('TreeOpen', function()
--   bufferline_state.set_offset(get_tree_size())
-- end)
-- 
-- nvim_tree_events.subscribe('Resize', function()
--   bufferline_state.set_offset(get_tree_size())
-- end)
-- 
-- nvim_tree_events.subscribe('TreeClose', function()
--   bufferline_state.set_offset(0)
-- end)
EOF

let g:minimap_width = 5
" let g:minimap_auto_start = 1
let g:minimap_auto_start_win_enter = 1
let g:minimap_git_colors = 1
let g:minimap_highlight_range = 1
let g:minimap_highlight_search = 1

" Auto-format on save
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
let g:neoformat_clangformat = {
  \ 'exe': 'clang-format',
  \ 'args': ['-style=file'],
  \ 'stdin': 1,
  \ }

" NERDtree
nnoremap <leader>nt :NvimTreeFindFileToggle<CR>

" This breaks stuff
" autocmd BufEnter * NvimTreeFindFileToggle

colorscheme onedark

" shortcuts to go to vimrc
nnoremap <leader>ss :source $MYVIMRC<CR>
nnoremap <leader>se :e $MYVIMRC<CR>

" spacemacs like window management
nnoremap <leader>wj :wincmd j<CR>
nnoremap <leader>wk :wincmd k<CR>
nnoremap <leader>wh :wincmd h<CR>
nnoremap <leader>wl :wincmd l<CR>
nnoremap <leader>+ :res +5<CR>
nnoremap <leader>_ :res -5<CR>
nnoremap <leader>wo :on<CR>
nnoremap <leader>wd :q<CR>

nnoremap <leader>sv :vsplit <CR>
nnoremap <leader>sh :split <CR>

" barbar buffer management
nnoremap <leader>bn :BufferNext <CR>
nnoremap <leader>bp :BufferPrevious <CR>
nnoremap <leader>bd :BufferClose <CR>
nnoremap <leader>bb :BufferPick <CR>

nnoremap <leader>tl :tabnext <CR>
nnoremap <leader>th :tabprevious <CR>
nnoremap <leader>tn :tabnew <CR>
nnoremap <leader>td :tabclose <CR>
nnoremap <leader>tt :tabedit %<CR>

" git mappings
nnoremap <leader>gd :Gitsigns diffthis<CR>

" Terminal mappings
:tnoremap <Esc> <C-\><C-n>

" Copy to clipboard
" "+y
" Telescope mappings
" Find files using Telescope command-line sugar.
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>ff <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fs <cmd>Telescope grep_string<cr>

nnoremap <leader>mm :MinimapToggle<cr>

" Git mappings
nnoremap <leader>gs <cmd>Neogit<cr>

" Coc Default config
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" CTRL + O and CTRL + I to jump back and forth in nav

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" autocmd CursorHold * silent call ShowDocumentation()

" Symbol renaming.
" nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
" nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
" nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
" nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>



" NOTE: If barbar's option dict isn't created yet, create it
let bufferline = get(g:, 'bufferline', {})

" Enable/disable animations
let bufferline.animation = v:true

" Enable/disable auto-hiding the tab bar when there is a single buffer
let bufferline.auto_hide = v:false

" Enable/disable current/total tabpages indicator (top right corner)
let bufferline.tabpages = v:true

" Enable/disable close button
let bufferline.closable = v:true

" Enables/disable clickable tabs
"  - left-click: go to buffer
"  - middle-click: delete buffer
let bufferline.clickable = v:true

" Excludes buffers from the tabline
let bufferline.exclude_ft = ['javascript']
let bufferline.exclude_name = ['package.json']

" Enable/disable icons
" if set to 'buffer_number', will show buffer number in the tabline
" if set to 'numbers', will show buffer index in the tabline
" if set to 'both', will show buffer index and icons in the tabline
" if set to 'buffer_number_with_icon', will show buffer number and icons in the tabline
let bufferline.icons = v:true

" Sets the icon's highlight group.
" If false, will use nvim-web-devicons colors
let bufferline.icon_custom_colors = v:false

" Configure icons on the bufferline.
let bufferline.icon_separator_active = '▎'
let bufferline.icon_separator_inactive = '▎'
let bufferline.icon_close_tab = ''
let bufferline.icon_close_tab_modified = '●'
let bufferline.icon_pinned = '車'

" If true, new buffers will be inserted at the start/end of the list.
" Default is to insert after current buffer.
let bufferline.insert_at_start = v:false
let bufferline.insert_at_end = v:false

" Sets the maximum padding width with which to surround each tab.
let bufferline.maximum_padding = 4

" Sets the maximum buffer name length.
let bufferline.maximum_length = 30

" If set, the letters for each buffer in buffer-pick mode will be
" assigned based on their name. Otherwise or in case all letters are
" already assigned, the behavior is to assign letters in order of
" usability (see order below)
let bufferline.semantic_letters = v:true

" New buffer letters are assigned in this order. This order is
" optimal for the qwerty keyboard layout but might need adjustement
" for other layouts.
let bufferline.letters =
  \ 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP'

" Sets the name of unnamed buffers. By default format is "[Buffer X]"
" where X is the buffer number. But only a static string is accepted here.
let bufferline.no_name_title = v:null
