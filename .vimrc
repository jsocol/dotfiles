syntax on
set nocompatible
set tabstop=4
set expandtab
set autoindent
set shiftwidth=4
set smarttab
set sts=4
set smartindent
set colorcolumn=+1
set formatoptions=tcqro
set modeline
set modelines=5
set nowrap
set number
set signcolumn=yes
set showmatch
set ignorecase
set smartcase
set hlsearch
set incsearch
set autoread
set title
set noerrorbells
set lz
set t_Co=256
set hidden
set backspace=2
set termwinsize=10x0
set splitbelow

set history=1000
set undolevels=1000
set wildignore=*.pyc,*.swp,*.class,*.bak

set pastetoggle=<F2>

autocmd BufNewFile,BufRead .git/COMMIT_EDITMSG setlocal tw=72 cc=+1
autocmd BufWritePost ~/.vimrc so ~/.vimrc

let mapleader=";"

let g:go_def_mapping_enabled = 0

call plug#begin('~/.vim/plugged')

" vim itself
Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'sjl/gundo.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" all language support
Plug 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}

" specific languages
Plug 'jmcantrell/vim-virtualenv'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
Plug 'jparise/vim-graphql'
Plug 'uarun/vim-protobuf'
"Plug 'ngmy/vim-rubocop'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'fs111/pydoc.vim'

" color schemes
Plug 'ajmwagar/vim-deus'
Plug 'iKarith/tigrana'
Plug 'joshdick/onedark.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'sainnhe/sonokai'
Plug 'sonph/onehalf', { 'rtp': 'vim' }

call plug#end()

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

let g:onedark_terminal_italics = 1

set background=dark
colorscheme onedark
"hi Comment cterm=italic

let g:ale_sign_column_always = 1
let g:ale_fixers = {
            \ '*': ['remove_trailing_lines', 'trim_whitespace'],
            \}
"let g:ale_linters = {
"            \ 'go': ['gofmt', 'golint', 'gopls'],
"            \}

let g:airline#extensions#ale#enabled = 1
let g:airline_theme = 'onedark'
let g:airline#extensions#tabline#enabled = 1
let NERDTreeQuitOnOpen=1
let g:gundo_prefer_python3=1

let g:coc_global_extensions = [
            \'coc-json',
            \'coc-tsserver',
            \'coc-go',
            \'coc-pyright',
            \'coc-pairs',
            \'coc-sh',
            \]

map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
nmap <C-n> :bn<CR>
nmap <C-m> :bp<CR>
nmap <silent> c :let @/=""<CR>
cmap w!! w !sudo tee % >/dev/null
map <F8> Oimport pdb; pdb.set_trace()<Esc>
inoremap # X<BS>#
nnoremap <leader>g :GundoToggle<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Goto code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>rf <Plug>(coc-refactor)

let @h = "yypVr"
