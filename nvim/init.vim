"
" Plugins
"
call plug#begin('~/.vim/plugged')
Plug 'christoomey/vim-tmux-navigator'
Plug 'github/copilot.vim'
Plug 'janko-m/vim-test'
Plug 'neovim/nvim-lspconfig'
Plug 'jlcrochet/vim-rbs'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'
Plug 'itchyny/lightline.vim'

Plug 'ryanoasis/vim-devicons'
Plug 'tjammer/blayu.vim'
Plug 'haishanh/night-owl.vim'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
call plug#end()

set encoding=UTF-8

"
" General config
"
if (has("termguicolors"))
  set termguicolors
endif

syntax on
set nocompatible
set cursorline
set t_Co=256
set ttyfast
set lazyredraw
set noshowcmd
set hidden
set expandtab
set showmatch
set incsearch
set hlsearch
set ignorecase smartcase
set nobackup
set nowritebackup
set nojoinspaces
set autoread
set history=10000
set backspace=indent,eol,start
set synmaxcol=200

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

"
" Display spaces as dots
"
set list
set lcs+=space:·

"
" Lightline
"
let g:lightline = {
    \ 'active': {
    \   'left': [['mode', 'paste'], ['filename', 'readonly']],
    \   'right': [['lineinfo'], ['filetype']],
    \ },
    \ 'component_function': {
    \   'filename': 'LightlineFilename',
    \   'readonly': 'LightlineReadOnly',
    \   'filetype': 'LightlineFiletype',
    \ },
    \ 'separator': { 'left': '', 'right': '' },
  \ }

set laststatus=2

function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction

function! LightlineReadOnly()
  return &readonly && &filetype !~# '\v(help|vimfiler|unite)' ? "\uf023" : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

"
" Theme switching
"
function LightTheme()
  set background=light
  colorscheme onehalflight
  let g:lightline = { 'colorscheme': 'onehalflight' }
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction

function DarkTheme()
  set background=dark
  colorscheme catppuccin-macchiato
  let g:lightline = {'colorscheme': 'catppuccin'}
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction

let g:rainbow_active = 0
call DarkTheme()

command! -bar Light call LightTheme()
command! -bar Dark call DarkTheme()
"
" Leader key
"
let mapleader=',' " Remap the leader key
let maplocalleader=","

"
" Additional mappings
"
nnoremap <silent> <Leader>u :GundoToggle<CR>
nnoremap <silent> <Leader>f :StripWhitespace<CR>
nnoremap <silent> <C-g>c :GitGutterToggle<CR>

"
" Fugitive
"
nmap <leader>gs :Git<CR>
nmap <leader>gb :Git blame<CR>

"
" Telescope
"
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fs <cmd>Telescope search_history<cr>
nnoremap <leader>fm <cmd>Telescope marks<cr>

" Use Esc to exit terminal-mode.
tnoremap <Esc> <C-\><C-n>

" Use <Leader>l to clear the highlighting of :set hlsearch.
if maparg('<Leader>l', 'n') ==# ''
  nnoremap <Leader>l :nohlsearch<CR>
endif

nnoremap <Leader>T <C-W><S-T>
nnoremap <Leader>t :TagbarToggle<CR>

" vim tmux navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-J> :TmuxNavigateDown<cr>
nnoremap <silent> <C-K> :TmuxNavigateUp<cr>
nnoremap <silent> <C-L> :TmuxNavigateRight<cr>
nnoremap <silent> <C-H> :TmuxNavigateLeft<cr>

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

set noswapfile

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
let test#strategy = "neovim"

map <silent> <C-t>n :TestNearest<CR>
map <silent> <C-t>f :TestFile<CR>
map <silent> <C-t>s :TestSuite<CR>
map <silent> <C-t>l :TestLast<CR>

"
" Webdev icons
"
let g:WebDevIconsOS = 'Darwin'
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['md'] = "\ue73e"
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['rb'] = "\ue791"
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['ru'] = "\ue791"
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['sh'] = "\uf489"
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['css'] = "\uf13c"
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['html'] = "\uf13b"

let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.gitlab-ci.yml'] = "\uf296"
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.gitignore'] = "\ue725"
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.dockerignore'] = "\ue7b0"
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.keep'] = "\ue725"
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.gitkeep'] = "\ue725"
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.brakeman.ignore'] = "\ufb88"
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['schema.rb'] = "\uf472"
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['secrets.yml'] = "\uf21b"
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.npmrc'] = "\ue71e"
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['package.json'] = "\ue71e"
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['package-lock.json'] = "\ue71e"
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.eslintignore'] = "\ue60c"
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.eslintrc.js'] = "\ue60c"

let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['Gemfile'] = "\ue791"
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['Rakefile'] = "\ue791"
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['webpack'] = "\ufc29"
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['vue'] = "\ufd42"

runtime macros/matchit.vim

lua <<EOF
require('lspconfig').ruby_lsp.setup{}
require('lspconfig').clangd.setup{}
EOF
