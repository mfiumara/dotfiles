nnoremap <SPACE> <Nop>
let mapleader = " "

set ttimeout
set ttimeoutlen=10

set fillchars+=diff:╱

filetype on
filetype indent on
filetype plugin on

set encoding=UTF-8
set updatetime=100

set foldenable 
set foldmethod=indent

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

" Tab management
Plug 'kdheepak/tabline.nvim'

" Folding
Plug 'tmhedberg/SimpylFold'
" File trees
" Plug 'preservim/nerdtree' |
"             \ Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kyazdani42/nvim-tree.lua'

" Mini-map
Plug 'wfxr/minimap.vim', {'do': ':!cargo install --locked code-minimap'}

" Themes
Plug 'joshdick/onedark.vim'
Plug 'rebelot/kanagawa.nvim'

" Icons
" Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)

" Syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'folke/todo-comments.nvim'

" Terminal stuff
Plug 'akinsho/toggleterm.nvim', {'tag' : 'v2.*'}

" Git plugins
" Handled by VGit
" Plug 'airblade/vim-gitgutter'
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'
" Plug 'tanvirtin/vgit.nvim'
" Plug 'TimUntersberger/neogit'
Plug 'sindrets/diffview.nvim'

" Debugger
" Plug 'puremourning/vimspector'
" Plug 'sakhnik/nvim-gdb'

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

" Lainnguage specific plugins
Plug 'hashivim/vim-terraform'

Plug 'fatih/vim-go', { 'do': 'GoInstallBinaries' }
" Linter
Plug 'sbdchd/neoformat'

call plug#end()

let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

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

let g:neoformat_enabled_yaml = ['prettier']

" NERDtree
nnoremap <leader>nt :NvimTreeFindFileToggle<CR>

" This breaks stuff
" autocmd BufEnter * NvimTreeFindFileToggle

colorscheme onedark
" colorscheme kanagawa

" shortcuts to go to vimrc
nnoremap <leader>ss :source $MYVIMRC<CR>
nnoremap <leader>se :e $MYVIMRC<CR>

" Quickfix list
nnoremap <leader>qo :copen<CR>
nnoremap <leader>qc :cclose<CR>
nnoremap <leader>qn :cnext<CR>
nnoremap <leader>qp :cprev<CR>
nnoremap <leader>qt :cfirst<CR>
nnoremap <leader>ql :clast<CR>

" spacemacs like window management
nnoremap <leader>wj :wincmd j<CR>
nnoremap <leader>wk :wincmd k<CR>
nnoremap <leader>wh :wincmd h<CR>
nnoremap <leader>wl :wincmd l<CR>
nnoremap <leader>wr :wincmd r<CR>
nnoremap <leader>+ :res +5<CR>
nnoremap <leader>_ :res -5<CR>
nnoremap <leader>wo :on<CR>
nnoremap <leader>wd :q<CR>

nnoremap <leader>sv :vsplit <CR>
nnoremap <leader>sh :split <CR>

" barbar buffer management
nnoremap <leader>bn :bnext <CR>
nnoremap <leader>bp :bprevious <CR>
nnoremap <leader>bd :bdelete <CR>
nnoremap <leader>bb <cmd>Telescope buffers<cr>
nnoremap <leader>br :file 

nnoremap <leader>tl :tabnext <CR>
nnoremap <leader>th :tabprevious <CR>
" nnoremap <tab> :tabnext <CR>
" nnoremap <S-tab> :tabprevious <CR>
nnoremap <leader>tn :tabnew <CR>
nnoremap <leader>td :tabclose <CR>
" nnoremap <leader>tt :tabedit %<CR>
" nnoremap <leader>` :ToggleTerm<CR>
nnoremap <leader>tr :TablineTabRename 

" Todo's
nnoremap <leader>? :TodoTelescope <CR>

" Git mappings
nnoremap <leader>gd :Gitsigns diffthis<CR>
nnoremap <leader>gs <cmd>:G<CR>
nnoremap <leader>gf <cmd>:Git fetch<CR>
nnoremap <leader>gb :Git checkout -b<SPACE>
nnoremap <leader>gc :Git checkout<SPACE>
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gl :Git log --oneline<CR>

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

nnoremap <leader>gat :GoAddTags bson<cr>
nnoremap <leader>gfs :GoFillStruct<cr>


let g:go_metalinter_autosave_enabled = ['all']
let g:go_addtags_transform = 'camelcase'

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

" CoC shortcuts when using ultisnip
" inoremap <silent><expr> <TAB>
"       \ coc#pum#visible() ? coc#_select_confirm() :
"       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"       \ CheckBackSpace() ? "\<TAB>" :
"       \ coc#refresh()
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'

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

" Language specific extensions
nmap <silent> glre <cmd>CocCommand rust-analyzer.explainError<CR>


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

lua << EOF
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- empty setup using defaults
require('nvim-treesitter.configs').setup {
	ensure_installed = { "c", "lua", "rust" },
}
 
require('toggleterm').setup{
	direction = 'float',
	open_mapping = [[<leader>`]],
	insert_mapping = true,
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
				width = 50,
				height = 50,
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
	},
	current_line_blame = true,
}
require('telescope').setup{
  defaults = {
    layout_strategy = 'vertical',
  },
}

require('todo-comments').setup {}

local nvim_tree_events = require('nvim-tree.events')

require('tabline').setup {}

EOF

