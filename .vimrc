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

set exrc
set secure

set pastetoggle=<F2>

autocmd BufNewFile,BufRead *.html.gotpl filetype=gohtmltmpl
autocmd BufNewFile,BufRead .git/COMMIT_EDITMSG setlocal tw=72 cc=+1
autocmd BufWritePost ~/.vimrc so ~/.vimrc
autocmd BufNewFile,BufRead *.html setlocal ts=2 sts=2 sw=2
autocmd BufWritePre *.tf TerraformFmt

let mapleader=";"

let NERDTreeQuitOnOpen = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'onedark'
let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1
let g:ftplugin_sql_omni_key = '<C-p>'
let g:go_auto_type_info=1
let g:go_def_mapping_enabled = 0
let g:go_doc_balloon = 1
let g:go_doc_popup_window = 1
let g:go_fmt_command = "gopls"
let g:go_gopls_complete_unimported = 1
let g:go_gopls_deep_completion = 1
let g:go_gopls_gofumpt = 1
let g:gundo_prefer_python3 = 1
let g:html_syntax_folding = 1
let g:onedark_terminal_italics = 1
let g:ruby_indent_assignment_style = 'variable'
let g:ruby_indent_hanging_elements = 0
let g:ruby_operators = 1
let g:ruby_pseudo_oeprators = 1
let g:ruby_space_errors = 1
let g:rubycomplete_classes_in_global = 1
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:snips_author = "James Socol"
let g:snips_email = "me@jamessocol.com"
let g:snips_github = "https://github.com/jsocol"

let g:ale_fixers = {
            \ '*': ['remove_trailing_lines', 'trim_whitespace'],
            \ 'javascript': ['eslint'],
            \ 'typescript': ['eslint'],
            \ 'typescriptreact': ['eslint'],
            \ 'ruby': ['standardrb'],
            \}
let g:ale_linters = {
            \ 'typescript': ['tsserver', 'eslint'],
            \ 'typescriptreact': ['tsserver', 'eslint'],
            \ 'ruby': ['standardrb'],
            \}

let g:coc_global_extensions = [
            \'coc-basedpyright',
            \'coc-clangd',
            \'coc-go',
            \'coc-html',
            \'coc-json',
            \'coc-lua',
            \'coc-markdownlint',
            \'coc-rust-analyzer',
            \'coc-sh',
            \'coc-snippets',
            \'coc-tsserver',
            \'coc-ultisnips',
            \'coc-yaml',
            \]


call plug#begin('~/.vim/plugged')

" vim itself
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'dense-analysis/ale'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdtree'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" all language support
Plug 'SirVer/ultisnips'
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/tagbar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" specific languages
Plug 'Quramy/tsuquyomi'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'fs111/pydoc.vim'
Plug 'hashivim/vim-terraform'
Plug 'jjo/vim-cue'
Plug 'jmcantrell/vim-virtualenv'
Plug 'jparise/vim-graphql'
Plug 'leafgarland/typescript-vim'
Plug 'rust-lang/rust.vim'
Plug 'uarun/vim-protobuf'
"Plug 'ngmy/vim-rubocop'
Plug 'vim-ruby/vim-ruby'

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

set background=dark
colorscheme onedark
hi Comment cterm=italic
hi CocMenuSel ctermbg=109 guibg=#13354A

call ale#linter#Define('typescriptreact', {
\   'name': 'tsserver',
\   'lsp': 'tsserver',
\   'executable': {b -> ale#node#FindExecutable(b, 'typescript_tsserver', [
\       'node_modules/.bin/tsserver',
\   ])},
\   'command': '%e',
\   'project_root': function('ale#handlers#tsserver#GetProjectRoot'),
\   'language': '',
\})

inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <C-n> coc#pum#visible() ? coc#pum#next(0) : "\<C-n>"
inoremap <silent><expr> <C-p> coc#pum#visible() ? coc#pum#prev(1) : "\<C-p>"

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
nmap <C-M> <Esc>:bn<CR><Esc>
nmap <C-m> <Esc>:bp<CR><Esc>

" clear the search terms
nmap <silent> c :let @/=""<CR><CR>

" if you forgot to sudo vim something and really need to write it
cmap w!! w !sudo tee % >/dev/null
nmap <F8> :TagbarToggle<CR>
inoremap # X<BS>#
nnoremap <leader>g :GundoToggle<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>T :NERDTreeToggle %<CR>

" navigate linter errors
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <silent> <C-k> <Plug>(ale_previous_wrap)

" snippets
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
xmap <leader>x <Plug>(coc-convert-snippet)

" Goto code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gt <Plug>(coc-type-definition)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>rf <Plug>(coc-refactor)

" vim-surround
nmap <leader>q ysiw
nmap <leader>rq ds
nmap <leader>cq cs

au FileType go nmap <leader>ge <Plug>(go-iferr)

let @h = "yypVr"
