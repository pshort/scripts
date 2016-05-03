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

set laststatus=2
set cmdheight=2

set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

function! HasPaste()
    if &paste
        return 'PASTE MODE '
    en
    return ''
endfunction
