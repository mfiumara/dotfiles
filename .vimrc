" Basics "
syntax enable   " enable syntax processing

set tabstop=4   " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab   " tabs are spaces
set number  " show line numbers

" Plugins "


let g:airline#extensions#tabline#enabled = 1 " Shows buffer status in status bar

call plug#begin('~/.vim/plugged')

Plug 'flazz/vim-colorschemes'
Plug 'kien/ctrlp.vim'

call plug#end()

set colorscheme twilight
