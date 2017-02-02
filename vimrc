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
" If I forgot to sudo vim a file, do that with :w!!
cmap w!! w !sudo tee %

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
noremap <C-n> :tabnext<CR>
set guicursor=a:block-blinkoff1


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

"------------------------------------------------------------------------------
" NeoComplete
"------------------------------------------------------------------------------

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

" Use neocomplete.
let g:neocomplete#enable_at_startup = 1

" Use smartcase.
let g:neocomplete#enable_smart_case = 1

" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Close popup by <Space>.
" inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.go = '[^.[:digit:] *\t]\.'

