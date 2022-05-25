nnoremap <SPACE> <Nop>
let mapleader = " "

filetype on
filetype indent on
filetype plugin on

set encoding=UTF-8

syntax on
set nocompatible
set number relativenumber
set ruler

nnoremap <leader>ss :source $MYVIMRC<CR>
nnoremap <leader>se :e $MYVIMRC<CR>

" spacemacs like window management
nnoremap <leader>wj :wincmd j<CR>
nnoremap <leader>wk :wincmd k<CR>
nnoremap <leader>wh :wincmd h<CR>
nnoremap <leader>wl :wincmd l<CR>
nnoremap <leader>wsv :vsplit <CR>
nnoremap <leader>wsh :split <CR>

" spacemacs like tab management
nnoremap <leader>tl :tabnext <CR>
nnoremap <leader>th :tabprevious <CR>
nnoremap <leader>tn :tabnew <CR>

" netrw
nnoremap <leader>t :20Lexplore<CR>
