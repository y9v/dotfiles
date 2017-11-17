"
" Plugins
"
call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'jremmen/vim-ripgrep'
Plug 'sjl/gundo.vim'
Plug 'janko-m/vim-test'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'airblade/vim-gitgutter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'sheerun/vim-polyglot'
Plug 'christoomey/vim-tmux-navigator'
Plug 'itchyny/lightline.vim'
Plug 'mhartington/oceanic-next'
Plug 'arcticicestudio/nord-vim'
call plug#end()

"
" GUI colors and theming
"
if (has("termguicolors"))
  set termguicolors
endif

syntax on
" let g:oceanic_next_terminal_bold=1
" let g:oceanic_next_terminal_italic=1
let g:nord_italic_comments = 1
let g:nord_uniform_diff_background = 1
colorscheme nord
let g:lightline = { 'colorscheme': 'nord' }

"
" Leader key
"
let mapleader=',' " Remap the leader key

"
" Additional mappings
"
nnoremap <silent> <C-O> :CtrlPBuffer<CR>
nnoremap <silent> <Leader>u :GundoToggle<CR>
nnoremap <silent> <Leader>f :StripWhitespace<CR>
nnoremap <silent> <C-g>t :GitGutterToggle<CR>
nnoremap <silent> <C-g>b :Gblame<CR>

" Use <Leader>l to clear the highlighting of :set hlsearch.
if maparg('<Leader>l', 'n') ==# ''
  nnoremap <Leader>l :nohlsearch<CR>
endif

nnoremap <Leader>t <C-W><S-T>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"
" Configuration
"
set showmatch           " Show matching brackets.
set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=2           " Render TABs using this many spaces.
set shiftwidth=2        " Indentation amount for < and > commands.
set numberwidth=5       " Width for line-numbers

set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters

" Don't show ~ for blank lines
" hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg

"
" RipGrep configuration
"
let g:rg_highlight=1

"
" CtrlP Configuration
"
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_user_command=['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_max_depth=40
let g:ctrlp_use_caching=0

"
" NERDTree configuration
"
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1

" Project specific bookmarks
if isdirectory(expand(".git"))
  let g:NERDTreeBookmarksFile = '.git/.nerdtree-bookmarks'
endif

function MyNerdToggle()
  if &filetype == 'nerdtree'
    :NERDTreeToggle
  else
    :NERDTreeFind
  endif
endfunction

nnoremap <silent> <C-N> :call MyNerdToggle()<CR>

"
" Gitgutter configuration
"
let g:gitgutter_enabled=0

"
" Vim test configuration
"
map <silent> <C-t>n :TestNearest<CR>
map <silent> <C-t>f :TestFile<CR>
map <silent> <C-t>s :TestSuite<CR>
map <silent> <C-t>l :TestLast<CR>
