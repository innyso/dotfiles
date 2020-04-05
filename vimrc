call plug#begin('~/.vim/plugged')

Plug 'othree/yajs.vim'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'iberianpig/tig-explorer.vim'
Plug 'nvie/vim-flake8'
Plug 'hashivim/vim-terraform'
Plug 'ycm-core/YouCompleteMe'
Plug 'SirVer/ultisnips'

" snippet for ultisnips
Plug 'honza/vim-snippets'
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

call plug#end()

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
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
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
noremap <leader>q :q<cr>
" :wq
noremap <leader>wq :wq<cr>
" If I forgot to sudo vim a file, do that with :w!!
cmap w!! w !sudo tee %

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
noremap <C-n> :tabnext<CR>
set guicursor=a:block-blinkoff1

" control size of split
nnoremap <C-a> <C-w>>
nnoremap <C-d> <C-w>=
nnoremap <C-s-f> <C-w>\|

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

" git related stuff
map <LocalLeader>gw :Gwrite<CR><CR>
map <LocalLeader>gs :Gstatus<CR>
map <LocalLeader>gc :Gcommit<CR>
map <LocalLeader>gu :Gpush origin master<CR>
map <LocalLeader>gp :Gpull origin master<CR>

" Tig
nnoremap <LocalLeader>gv :Tig<CR>

" markdown preview setting
let vim_markdown_preview_github=1
let vim_markdown_preview_toggle=2
let vim_markdown_preview_browser='Google Chrome'

" fzf
map <C-P> :FZF<CR>

" python stuff
autocmd BufWritePost *.py call Flake8()

" terraform
let g:terraform_fmt_on_save=1

" ultisnips
let g:UltiSnipsExpandTrigger=";"
