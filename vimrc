call pathogen#infect()
call pathogen#helptags()

set encoding=utf8
set termencoding=utf8

imap jj <esc>
let maplocalleader=','
let mapleader=','

syntax on
syntax enable
filetype on
filetype indent on
filetype plugin on
set nocompatible
set t_Co=256
set autoindent
set nosmartindent						" auto/smart indent
set noerrorbells
set visualbell t_vb=
set undolevels=500
set backspace=indent,eol,start
set ttyfast

map <LocalLeader>n :set invnumber<CR>
set smarttab
set tabstop=2
set cursorline						" show underline
set showmatch							" show matching bracket
set nofoldenable
set matchpairs+=<:>

" Map space to / (search) and c-space to ? (backgwards search)
map <space> /
map <LocalLeader><space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <LocalLeader><cr> :noh<cr>

" Use the arrows to something usefull
map <right> :bnext!<cr>
map <left> :bprevious!<cr>
map <down> :buffers<cr>
map <C-D> :bd<cr>

" making searching better in vim
set incsearch								" incremental search
set ignorecase 							" search ignore case
set smartcase								" ignore case when seraching lowercase
set hlsearch								" highlight the search
set diffopt=filler,iwhite		" ignore all whitespace and sync

" dont want backup or swap files
set nobackup
set nowritebackup
set noswapfile


" spelling checker, toggle with ,ss or F6
if v:version >= 700

      setlocal spell spelllang=en
      nmap <LocalLeader>s :set spell!<CR>

endif
set nospell									" default to no spelling

"Spelling related Shortcuts using <LocalLeader>
map <LocalLeader>sn ]s
map <LocalLeader>sp [s
map <LocalLeader>sa zg
map <LocalLeader>ss z=
" When I'm pretty sure that the first suggestion is correct
map <LocalLeader>s! 1z=

" q: sucks
nmap q: :q
" If I forgot to sudo vim a file, do that with :w!!
cmap w!! w !sudo tee %

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
noremap <C-n> :tabnext<CR>
set guicursor=a:block-blinkoff1

" Use 2 spaces in puppet, ruby and xml files
autocmd FileType puppet,xml,ruby set shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" Open and close the NERDTree
map <LocalLeader>t :NERDTreeToggle<CR>
let NERDTreeWinPos="left"
let NERDTreeWinSize=20

" CtrlP - fuzzy search
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" status line
set laststatus=2

" Tagbar
nmap <LocalLeader>d :TagbarToggle<CR>

" toggle paste mode
nmap <LocalLeader>pp :set paste!<cr>
" open all folds
nmap <LocalLeader>o  :%foldopen!<cr>
" close all folds
nmap <LocalLeader>c  :%foldclose!<cr>

" Set airline setting
let g:airline_powerline_fonts = 1
