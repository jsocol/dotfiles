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
set formatoptions=tcqro
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

set history=1000
set undolevels=1000
set wildignore=*.pyc,*.swp,*.class,*.bak

set pastetoggle=<F2>

hi ColorColumn ctermbg=darkblue
hi Comment ctermbg=blue ctermfg=white
hi Search term=standout ctermfg=0 ctermbg=11 guifg=Blue guibg=Yellow

map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-b> <Esc>:tabnew<CR><Esc>
map <C-n> <Esc>:tabn<CR><Esc>
map <C-m> <Esc>:tabp<CR><Esc>
nmap <silent> c :let @/=""<CR>
cmap w!! w !sudo tee % >/dev/null
map <F8> Oimport pdb; pdb.set_trace()<Esc>
inoremap <C-s> <Esc>w !sendmail -t<CR>
inoremap # X<BS>#
nnoremap <F5> :GundoToggle<CR>
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <silent> <C-k> <Plug>(ale_previous_wrap)

let @h = "yypVr"

autocmd BufNewFile,BufRead *.py setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class,with tw=79 cc=+1
autocmd BufNewFile,BufRead *.html,*.js,*.jsx,*.json setlocal sts=2 sw=2 ts=2 tw=1000
autocmd BufNewFile,BufRead *.json setf javascript
autocmd BufNewFile,BufRead *.rst,*.md,*.markdown setlocal tw=72 cc=+1
autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
autocmd BufNewFile,BufRead .git/COMMIT_EDITMSG setlocal tw=72 cc=+1
autocmd BufWritePost ~/.vimrc so ~/.vimrc
autocmd BufWrite *.py,*.js,*.html,*.php mark ' | silent! %s/\s\+$// | norm ''

call plug#begin('~/.vim/plugged')

Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'ajmwagar/vim-deus'
Plug 'iKarith/tigrana'
Plug 'jmcantrell/vim-virtualenv'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jparise/vim-graphql'
Plug 'uarun/vim-protobuf'
Plug 'ngmy/vim-rubocop'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

set background=dark
colorscheme deus

let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
