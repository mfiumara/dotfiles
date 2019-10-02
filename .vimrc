" Basics "
syntax enable   " enable syntax processing

" Tabs are spaces "
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

filetype plugin indent on

set number  " show line numbers

" Plugins "
call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'powerline/fonts'
Plug 'Valloric/YouCompleteMe'
"Plug 'bling/vim-bufferline'

call plug#end()

let g:airline#extensions#tabline#enabled = 1 " Shows buffer status in status bar
let g:airline_theme='simple'
let g:airline_powerline_fonts = 1

let g:airline_solarized_bg='dark'

let g:ctrlp_working_path_mode = 'ra'

" YouCompleteMe needs a Python2 interpreter and some standard flags to get C
" semantics "
"let g:ycm_server_python_interpreter = '/usr/bin/python2'
"let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

" Mappings "
inoremap jj <ESC>
let mapleader = ","
nnoremap ; :
nnoremap <leader><enter> :YcmCompleter GoTo<cr>
