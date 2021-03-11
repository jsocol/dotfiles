syntax on
set nocompatible
set tabstop=4
set expandtab
set autoindent
set shiftwidth=4
set smarttab
set sts=4
set smartindent
set textwidth=72
set colorcolumn=+1
set formatoptions=tcqro
set modeline
set modelines=5
set nowrap
set number
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
autocmd BufWrite *.py,*.js,*.html,*.php mark ' | silent! %s/\s\+$// | norm ''

call plug#begin('~/.vim/plugged')

" vim itself
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'sjl/gundo.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" all language support
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
Plug 'Townk/vim-autoclose'

" specific languages
Plug 'jmcantrell/vim-virtualenv'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
Plug 'jparise/vim-graphql'
Plug 'uarun/vim-protobuf'
"Plug 'ngmy/vim-rubocop'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

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

let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_theme = 'onedark'
let g:airline#extensions#tabline#enabled = 1

map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
nmap <C-n> :bn<CR>
nmap <C-m> :bp<CR>
nmap <silent> c :let @/=""<CR>
cmap w!! w !sudo tee % >/dev/null
map <F8> Oimport pdb; pdb.set_trace()<Esc>
inoremap <C-s> <Esc>w !sendmail -t<CR>
inoremap # X<BS>#
nnoremap <F5> :GundoToggle<CR>
nnoremap <F4> :NERDTreeToggle<CR>
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <silent> <C-k> <Plug>(ale_previous_wrap)

let @h = "yypVr"
