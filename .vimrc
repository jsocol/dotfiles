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

"hi ColorColumn ctermbg=darkblue
"hi Comment ctermbg=blue ctermfg=white cterm=italic
"hi Search term=standout ctermfg=0 ctermbg=11 guifg=Blue guibg=Yellow

autocmd BufNewFile,BufRead *.py setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class,with tw=79 cc=+1
autocmd BufNewFile,BufRead *.html,*.js,*.jsx,*.json,*.ts,*.tsx setlocal sts=2 sw=2 ts=2 tw=1000
autocmd BufNewFile,BufRead *.rst,*.md,*.markdown setlocal tw=72 cc=+1
autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
autocmd BufNewFile,BufRead .git/COMMIT_EDITMSG setlocal tw=72 cc=+1
autocmd BufWritePost ~/.vimrc so ~/.vimrc
autocmd BufWrite *.py,*.js,*.html,*.php mark ' | silent! %s/\s\+$// | norm ''

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'sjl/gundo.vim'
"Plug 'Townk/vim-autoclose'

" Colorschemes
Plug 'ajmwagar/vim-deus'
Plug 'joshdick/onedark.vim'
Plug 'iKarith/tigrana'

" all languages
Plug 'w0rp/ale'
Plug 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}
Plug 'junegunn/fzf.vim' " needed for previews
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}

" language support
Plug 'jmcantrell/vim-virtualenv'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
Plug 'jparise/vim-graphql'
Plug 'uarun/vim-protobuf'
Plug 'ngmy/vim-rubocop'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

set background=dark
colorscheme onedark
hi Comment cterm=italic

let mapleader=";"

let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='onedark'
let g:go_doc_balloon = 1
let g:go_doc_popup_window = 1
let g:go_def_mapping_enabled = 0
let g:go_fmt_command = "gopls"
let g:go_gopls_gofumpt=1
let g:go_auto_type_info = 1
let g:ftplugin_sql_omni_key = '<C-p>'
let NERDTreeQuitOnOpen=1
let g:gundo_prefer_python3=1

let g:ale_fixers = {
            \ '*': ['remove_trailing_lines', 'trim_whitespace'],
            \ 'javascript': ['eslint'],
            \ 'typescript': ['eslint'],
            \ 'typescriptreact': ['eslint'],
            \}
let g:ale_linters = {
            \ 'typescript': ['tsserver', 'eslint'],
            \ 'typescriptreact': ['tsserver', 'eslint'],
            \}
let g:ale_fix_on_save = 1

call ale#linter#Define('typescriptreact', {
\   'name': 'tsserver',
\   'lsp': 'tsserver',
\   'executable': {b -> ale#node#FindExecutable(b, 'typescript_tsserver', [
\       '.yarn/sdks/typescript/bin/tsserver',
\       'node_modules/.bin/tsserver',
\   ])},
\   'command': '%e',
\   'project_root': function('ale#handlers#tsserver#GetProjectRoot'),
\   'language': '',
\})

"autocmd filetype go inoremap <buffer> . .<C-x><C-o>
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

" // to search for selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_

" move between buffers in the current window
map <C-n> <Esc>:bn<CR><Esc>
map <C-m> <Esc>:bp<CR><Esc>

" clear the search terms
nmap <silent> c :let @/=""<CR>

" if you forgot to sudo vim something and really need to write it
cmap w!! w !sudo tee % >/dev/null
map <F8> Oimport pdb; pdb.set_trace()<Esc>
inoremap # X<BS>#
nnoremap <leader>g :GundoToggle<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>T :NERDTreeToggle %<CR>

" navigate linter errors
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <silent> <C-k> <Plug>(ale_previous_wrap)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gt <Plug>(coc-type-definition)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>rf <Plug>(coc-refactor)

" Snippets
au FileType go nmap <leader>ge <Plug>(go-iferr)

" an ancient helper I use to make ReST headings
let @h = "yypVr"
