set noswapfile
set history=700
set ruler
set autoread

colorscheme elflord
syntax on
set encoding=utf8

set expandtab
set smarttab

set shiftwidth=4
set tabstop=4

set ai
set si
set wrap

set number
set relativenumber

set laststatus=2
set cmdheight=2

set wildmenu
set showmatch
set incsearch
set hlsearch

set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" MAPPINGS

map <F2> :w<CR>
imap <F2> <ESC>:w<CR>
map <SPACE> <ESC>gg/

map <C-n> :NERDTreeToggle<CR>

" VUNDLE

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Plugin 'Valloric/YouCompleteMe'

Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'mattn/emmet-vim'
Plugin 'gcmt/taboo.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'rust-lang/rust.vim'

call vundle#end()

filetype plugin indent on

" FUNCTIONS

function! HasPaste()
    if &paste
        return 'PASTE MODE '
    en
    return ''
endfunction

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='badwolf'
