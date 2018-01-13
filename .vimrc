syntax on
"filetype plugin indent on
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
set backspace=2
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
"set termguicolors
set hidden
set cc=+1

set history=1000
set undolevels=1000
set wildignore=*.pyc,*.swp,*.class,*.bak
set wildmode=longest,list,full
set wildmenu

set pastetoggle=<F2>

hi ColorColumn ctermbg=darkblue
hi Comment ctermbg=blue ctermfg=white
hi Search term=standout ctermfg=0 ctermbg=11 guifg=Blue guibg=Yellow

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
map <C-b> <Esc>:tabnew<CR><Esc>
map <C-n> <Esc>:tabn<CR><Esc>
map <C-m> <Esc>:tabp<CR><Esc>
nmap <silent> c :let @/=""<CR>
cmap w!! w !sudo tee % >/dev/null
map <F8> Oimport pdb; pdb.set_trace()<Esc>
inoremap # X<BS>#
nnoremap <F5> :GundoToggle<CR>

let @h = "yypVr"

autocmd BufNewFile,BufRead *.py setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class,with tw=79 cc=+1
autocmd BufNewFile,BufRead *.html setlocal sts=2 sw=2 ts=2 tw=1000
autocmd BufNewFile,BufRead *.rst,*.md,*.markdown setlocal tw=72 cc=+1
autocmd BufNewFile,BufRead,BufWritePost *.md setlocal filetype=markdown
autocmd BufNewFile,BufRead,BufWritePost *.less setlocal filetype=css
autocmd BufNewFile,BufRead .git/COMMIT_EDITMSG setlocal tw=72 cc=+1
autocmd BufNewFile,BufRead *.yml,*.yaml setlocal sts=2 sw=2 ts=2
autocmd BufNewFile,BufRead *.go setlocal sts=4 ts=4 sw=4 noet
autocmd BufWritePost ~/.vimrc so ~/.vimrc
autocmd BufWrite *.py,*.js,*.html,*.php mark ' | silent! %s/\s\+$// | norm ''
autocmd BufNewFile,BufRead *.jinja setf django
"autocmd BufWritePost *.py call Flake8()

" Someday, make one of these work.
"au BufWritePost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent !chmod a+x <afile> | endif | endif
"autocmd BufWritePost * if getline(1) =~ "^#!" | silent !chmod +x <afile> | endif

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'iKarith/tigrana'
Plug 'ajmwagar/vim-deus'
Plug 'leafgarland/typescript-vim'
Plug 'vim-scripts/Gundo'
Plug 'w0rp/ale'

call plug#end()

"colorscheme tigrana-256-dark
set background=dark
colorscheme deus

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_python_checkers = ['flake8']

let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
