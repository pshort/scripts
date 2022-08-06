:set noswapfile
:set history=800
:set ruler
:set autoread
:set hidden
:set signcolumn=yes

:syntax on
:set encoding=utf8

:set number
:set relativenumber
:set list
:set listchars=tab:▸\ ,trail:·

:set autoindent
:set tabstop=2
:set shiftwidth=2
:set expandtab
:set smarttab
:set softtabstop=2
:set mouse=a
:set scrolloff=8
:set sidescrolloff=8
:set updatetime=300

:set ai
:set si
:set laststatus=2
:set cmdheight=2

:set splitright
:set splitbelow

:nnoremap <SPACE> <Nop>
let mapleader=" "

:nnoremap <silent> <leader>s :split<CR>
:nnoremap <silent> <leader>v :vsplit<CR>

:nnoremap <silent> <leader>k <C-w>k
:nnoremap <silent> <leader>j <C-w>j
:nnoremap <silent> <leader>h <C-w>h
:nnoremap <silent> <leader>l <C-w>l

:nnoremap <silent> <leader>tt :terminal<CR>


:nnoremap <silent> <leader>q :q<CR>

:nnoremap <silent> <leader>f :bp<CR>
:nnoremap <silent> <leader>t :bn<CR>
:nnoremap <silent> <leader>g :l<CR>

:nnoremap <silent> <leader>n :NERDTreeToggle<CR>

:nmap <leader>k :nohlsearch<CR>
:nmap <leader>Q :bufdo bdelete<CR>

:map <F2> :w<CR>
:imap <F2> <ESC>:w<CR>

:map ;; A;<Esc>
:imap ;; <Esc>A;<Esc>
:map ,, A,<Esc>
:imap ,, <Esc>A,<Esc>

call plug#begin()

Plug 'https://github.com/vim-syntastic/syntastic'
" We arent using ctrl p any more
" Plug 'https://github.com/kien/ctrlp.vim'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'https://github.com/sheerun/vim-polyglot'
Plug 'https://github.com/mattn/emmet-vim'
" surround things
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'voldikss/vim-floaterm'

call plug#end()

" FLOATTERM
" ====================

let g:floaterm_keymap_toggle = '<F5>'
let g:floaterm_keymap_next   = '<F6>'
let g:floaterm_keymap_prev   = '<F7>'
let g:floaterm_keymap_new    = '<F8>'

let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1

augroup FloatermCustomisations
    autocmd!
    autocmd ColorScheme * highlight FloatermBorder guibg=none
augroup END

" NERDTREE
" ====================

let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1

let g:NERDTreeDirArrowExpandable = '▹'
let g:NERDTreeDirArrowCollapsible = '▿'

nnoremap <expr> <leader>n g:NERDTree.IsOpen() ? ':NERDTreeClose<CR>' : @% == '' ? ':NERDTree<CR>' : ':NERDTreeFind<CR>'
nmap <leader>N :NERDTreeFind<CR>

" If more than one window and previous buffer was NERDTree, go back to it.
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif

" avoid crashes when calling vim-plug functions while the cursor is on the NERDTree window
let g:plug_window = 'noautocmd vertical topleft new'

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1

" FZF BINDINGS
" ====================

let g:fzf_layout = { 'up': '~90%', 'window': { 'width': 0.8, 'height': 0.8, 'yoffset': 0.5, 'xoffset': 0.5 } }
let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'

command! -bang -nargs=? -complete=dir Files
  \ call fzf#run(fzf#wrap('files', fzf#vim#with_preview({ 'dir': <q-args>, 'sink': 'e', 'source': 'rg --files --hidden'}), <bang>0))


command! -bang -nargs=? -complete=dir AllFiles
  \ call fzf#run(fzf#wrap('allfiles', fzf#vim#with_preview({ 'dir': <q-args>, 'sink': 'e', 'source': 'rg --files --hidden --no-ignore'}), <bang>0))

:nmap <leader>f :Files<CR>
:nmap <leader>F :AllFiles<CR>
:nmap <leader>b :Buffers<CR>
" :nmap <leader>h :History<CR>
:nmap <leader>r :Rg<CR>
:nmap <leader>R :Rg<space>

" COC STUFF
" ==============

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
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

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

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

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" OTHER GLOBALS
" ==============

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:coc_disable_startup_warning = 1
