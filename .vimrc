set tabstop=4
set expandtab
set autoindent
set shiftwidth=4
set smarttab
set sts=4
set smartindent
set textwidth=800000
set formatoptions=cqwr
set nowrap
set number
set showmatch
set ignorecase
set hlsearch
set incsearch
set autoread
set title
set noerrorbells

set history=1000
set undolevels=1000
set wildignore=*.pyc,*.swp,*.class,*.bak

set pastetoggle=<F2>

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
nmap <silent> ,/ :let @/=""<CR>
cmap w!! w !sudo tee % >/dev/null
map <F8> Oimport pdb; pdb.set_trace()<Esc>
inoremap # X<BS>#

let @h = "yypVr"

autocmd BufNewFile,BufRead *.py set cinwords=if,elif,else,for,while,try,except,finally,def,class,with
autocmd BufNewFile,BufRead *.html set sts=2 sw=2 ts=2
autocmd BufNewFile,BufRead *.rst set tw=79
autocmd! BufWrite * mark ' | silent! %s/\s\+$// | norm ''
"autocmd BufWritePost * if getline(1) =~ "^#!" | silent !chmod +x <afile> | endif
