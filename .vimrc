" Basics "
syntax enable   " enable syntax processing

set tabstop=4   " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab   " tabs are spaces
set number  " show line numbers

" Plugins "
call plug#begin('~/.vim/plugged')

Plug 'flazz/vim-colorschemes'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'powerline/fonts'
"Plug 'bling/vim-bufferline'

call plug#end()

" Set Colorscheme and status bar "
colorscheme wombat

let g:airline#extensions#tabline#enabled = 1 " Shows buffer status in status bar
let g:airline_theme='simple'
let g:airline_powerline_fonts = 1

let g:airline_solarized_bg='dark'
