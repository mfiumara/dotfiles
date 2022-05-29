nnoremap <SPACE> <Nop>
let mapleader = " "

filetype on
filetype indent on
filetype plugin on

set encoding=UTF-8
set updatetime=100

syntax on
set nocompatible
set number relativenumber
set ruler

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'fatih/vim-go', { 'do': 'GoInstallBinaries' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'SirVer/ultisnips'

Plug 'joshdick/onedark.vim'

" CoC language extensions
Plug 'neoclide/coc-json'
Plug 'josa42/coc-go'

call plug#end()

colorscheme onedark

" shortcuts to go to vimrc
nnoremap <leader>ss :source $MYVIMRC<CR>
nnoremap <leader>se :e $MYVIMRC<CR>

" spacemacs like window management
nnoremap <leader>wj :wincmd j<CR>
nnoremap <leader>wk :wincmd k<CR>
nnoremap <leader>wh :wincmd h<CR>
nnoremap <leader>wl :wincmd l<CR>

nnoremap <leader>sv :vsplit <CR>
nnoremap <leader>sh :split <CR>

" spacemacs like tab management
nnoremap <leader>tl :tabnext <CR>
nnoremap <leader>th :tabprevious <CR>
nnoremap <leader>tn :tabnew <CR>

" spacemacs like buffer management
nnoremap <leader>bn :bnext <CR>
nnoremap <leader>bp :bprevious <CR>
nnoremap <leader>bd :bdelete <CR>

" netrw
nnoremap <leader>t :20Lexplore<CR>
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_fastbrowse=0
let g:netrw_liststyle=3

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

