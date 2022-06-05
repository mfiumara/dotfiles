nnoremap <SPACE> <Nop>
let mapleader = " "

set ttimeout
set ttimeoutlen=10

filetype on
filetype indent on
filetype plugin on

set encoding=UTF-8
set updatetime=100

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
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
Plug 'fatih/vim-go', { 'do': 'GoInstallBinaries' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'joshdick/onedark.vim'

" CoC language extensions
Plug 'neoclide/coc-json'
Plug 'josa42/coc-go'

" Linter
Plug 'sbdchd/neoformat'

Plug 'akinsho/bufferline.nvim'

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
nnoremap <leader>bb :buffers <CR>

" Terminal mappings
:tnoremap <Esc> <C-\><C-n>

" NERDtree
nnoremap <leader>nt :NERDTreeToggleVCS<CR>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

