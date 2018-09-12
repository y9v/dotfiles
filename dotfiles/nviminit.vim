"
" Plugins
"
call plug#begin('~/.vim/plugged')
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'jremmen/vim-ripgrep'
Plug 'sjl/gundo.vim'
Plug 'janko-m/vim-test'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'w0rp/ale'
Plug 'maximbaz/lightline-ale'
Plug 'tpope/vim-unimpaired'
Plug 'airblade/vim-gitgutter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'sheerun/vim-polyglot'
Plug 'christoomey/vim-tmux-navigator'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'mhartington/oceanic-next'
Plug 'nightsense/snow'
call plug#end()

set encoding=UTF-8

"
" GUI colors and theming
"
if (has("termguicolors"))
  set termguicolors
endif

syntax on
set nolazyredraw
let g:oceanic_next_terminal_bold=1
let g:oceanic_next_terminal_italic=1

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

"
" Lightline
"
let g:lightline = {
    \ 'active': {
    \   'left': [['mode', 'paste'], ['filename', 'readonly']],
    \   'right': [['lineinfo'], ['linter_errors', 'linter_warnings'], ['filetype']],
    \ },
    \ 'component_function': {
    \   'filename': 'LightlineFilename',
    \   'readonly': 'LightlineReadOnly',
    \   'filetype': 'LightlineFiletype',
    \   'linter_warnings': 'lightline#ale#warnings',
    \   'linter_errors': 'lightline#ale#errors',
    \ },
    \ 'component_type': {
    \   'linter_warnings': 'warning',
    \   'linter_errors': 'error',
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
  colorscheme snow
  let g:lightline = { 'colorscheme': 'snow_light' }
  call lightline#init()
  call lightline#update()
endfunction

function DarkTheme()
  set background=dark
  colorscheme OceanicNext
  let g:lightline = { 'colorscheme': 'oceanicnext' }
  call lightline#init()
  call lightline#update()
endfunction

call DarkTheme()

command! -bar Light call LightTheme()
command! -bar Dark call DarkTheme()
"
" Leader key
"
let mapleader=',' " Remap the leader key

"
" Basic configuration
"
set hidden
set history=10000
set expandtab
set showmatch
set incsearch
set hlsearch
set ignorecase smartcase
set nobackup
set nowritebackup
set nojoinspaces
set autoread
set nocompatible
set backspace=indent,eol,start

"
" Additional mappings
"
inoremap jj <Esc>
nnoremap <silent> <Leader>u :GundoToggle<CR>
nnoremap <silent> <Leader>f :StripWhitespace<CR>
nnoremap <silent> <C-g>c :GitGutterToggle<CR>
nnoremap <silent> <C-g>b :Gblame<CR>

"
" FZF
"
map <silent> <C-p>f :GFiles<CR>
map <silent> <C-p>b :Buffers<CR>
map <silent> <C-p>s :GFiles?<CR>
map <silent> <C-p>t :Tags<CR>
map <silent> <C-p>m :Marks<CR>
map <silent> <C-p>h :History<CR>
map <silent> <C-p>c :BCommits<CR>

" Use Esc to exit terminal-mode.
tnoremap <Esc> <C-\><C-n>

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

set noswapfile

" Don't show ~ for blank lines
" hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg

"
" RipGrep configuration
"
let g:rg_highlight=1

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
function! DockerComposeTransformation(cmd) abort
  return 'docker-compose run --rm -e "RAILS_ENV=test" dev ' . a:cmd
endfunction

let g:test#custom_transformations = {'docker-compose': function('DockerComposeTransformation')}
command! -bar DockerComposeEnv let g:test#transformation = 'docker-compose'

map <silent> <C-t>n :TestNearest<CR>
map <silent> <C-t>f :TestFile<CR>
map <silent> <C-t>s :TestSuite<CR>
map <silent> <C-t>l :TestLast<CR>

"
" Ale configuration
"
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_lint_on_text_changed = 'never'
let g:lightline#ale#indicator_errors = "\uf05e "
let g:lightline#ale#indicator_warnings = "\ue3c6 "

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
