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

set history=1000
set undolevels=1000
set wildignore=*.pyc,*.swp,*.class,*.bak

set pastetoggle=<F2>

hi ColorColumn ctermbg=darkblue
hi Comment ctermbg=blue ctermfg=white
hi Search term=standout ctermfg=0 ctermbg=11 guifg=Blue guibg=Yellow

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
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

let @h = "yypVr"

autocmd BufNewFile,BufRead *.py setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class,with tw=79 cc=+1
autocmd BufNewFile,BufRead *.html,*.js,*.jsx,*.json setlocal sts=2 sw=2 ts=2 tw=1000
autocmd BufNewFile,BufRead *.json setf javascript
autocmd BufNewFile,BufRead *.rst,*.md,*.markdown setlocal tw=72 cc=+1
autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
autocmd BufNewFile,BufRead .git/COMMIT_EDITMSG setlocal tw=72 cc=+1
autocmd BufWritePost ~/.vimrc so ~/.vimrc
autocmd BufWrite *.py,*.js,*.html,*.php mark ' | silent! %s/\s\+$// | norm ''

" Someday, make one of these work.
"au BufWritePost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent !chmod a+x <afile> | endif | endif
"autocmd BufWritePost * if getline(1) =~ "^#!" | silent !chmod +x <afile> | endif

let g:maintainer='{ "name": "James Socol", "web": "http://coffeeonthekeyboard.com", "email": "james@mozilla.com" }'
