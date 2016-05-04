set noswapfile
set history=700
set ruler
set autoread

colorscheme torte
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
imap <F2> <ESC>:w<CR>i

" VUNDLE

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'

call vundle#end()

filetype plugin indent on

" FUNCTIONS

function! HasPaste()
    if &paste
        return 'PASTE MODE '
    en
    return ''
endfunction
