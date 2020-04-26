call plug#begin('~/.vim/plugged')
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'w0rp/ale'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'google/vim-jsonnet'
Plug 'tpope/vim-unimpaired'
Plug 'ervandew/supertab'
Plug 'keith/swift.vim'
call plug#end()

" Linters, fixers, and language servers.
let g:ale_linters = {
      \ }
let g:ale_fixers = {
            \ }
let g:ale_linters.rust = ['rls']
let g:ale_fixers.rust = ['rustfmt']
let g:ale_fixers.cpp = ['clang-format']
let g:ale_linters.cpp = ['clangd']
let g:ale_linters.javascript = []
let g:ale_fixers.javascript = []
let g:ale_linters.javascript = g:ale_linters.javascript + ['eslint']
let g:ale_fixers.javascript = g:ale_fixers.javascript + ['prettier']
let g:ale_linters.typescript = ['tsserver']
let g:ale_fixers.typescript = ['prettier']
let g:ale_linters_ignore = {'typescript': ['tslint']}
let g:ale_linters.python = ['pyls']
let g:ale_fixers.python = ['autopep8']
let g:ale_linters.swift = ['sourcekitlsp']
let g:ale_fixers.swift = ['swiftformat']
let g:ale_linters.go = ['gopls']
let g:ale_fixers.go = ['gofmt']
let g:ale_set_signs = 1
let g:ale_sign_column_always = 1
:highlight SignColumn guibg=none

" Configuration for completion engines.
let g:javascript_plugin_flow = 1
let g:ale_rust_rls_toolchain = 'nightly'
let g:ale_c_parse_compile_commands = 1
let g:ale_completion_tsserver_autoimport = 1
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
nmap <silent> <leader>ad :ALEGoToDefinitionInSplit<cr>
nmap <silent> <leader>afr :ALEFindReferences<cr>
nmap <silent> <leader>aff :ALEFix<cr>
nmap <silent> <leader>ah :ALEHover<cr>
nmap <silent> <leader>an :ALENext<cr>
nmap <silent> <leader>ap :ALEPrevious<cr>
nmap <silent> <leader>ar :ALERename<cr>
let g:go_def_mode='gopls'
let g:airline#extensions#ale#enabled = 1
let g:SuperTabDefaultCompletionType = "<c-n>"
set completeopt=longest,menuone
set pumheight=10
set termguicolors

" ctrlp
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_max_files=0
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files'],
    \ },
  \ 'fallback': 'find %s -type f'
  \ }


" General vim options
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set clipboard=unnamed
set hidden
:highlight Pmenu ctermbg=black guibg=black ctermfg=white guifg=white
:highlight PmenuSel ctermbg=DarkBlue guibg=DarkBlue ctermfg=white guifg=white
