call plug#begin('~/.vim/plugged')
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-flow.vim'
Plug 'prabirshrestha/asyncomplete-gocode.vim'
Plug 'pangloss/vim-javascript'
Plug 'w0rp/ale'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'kaicataldo/material.vim'
call plug#end()

let g:ale_linters = {
      \ }
let g:ale_fixers = {
            \ }
" Rust
if executable('rls')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
        \ 'workspace_config': {'rust': {'clippy_preference': 'on'}},
        \ 'whitelist': ['rust'],
        \ })
  let g:ale_linters.rust = ['rls']
  let g:ale_rust_rls_toolchain = 'nightly'
endif

if executable('rustfmt')
  let g:ale_fixers.rust = ['rustfmt']
endif

" C/C++ completion
if executable('clangd')
	au User lsp_setup call lsp#register_server({
				\ 'name': 'clangd',
				\ 'cmd': {server_info->['clangd']},
				\ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
				\ })
endif

if executable('clang-format')
  let g:ale_fixers.cpp = ['clang-format']
endif

" Javascript / Flow setup
if executable('flow')
	au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#flow#get_source_options({
				\ 'name': 'flow',
				\ 'whitelist': ['javascript'],
				\ 'completor': function('asyncomplete#sources#flow#completor'),
				\ }))
  let g:ale_linters.javascript = ['flow', 'eslint']
  let g:ale_fixers.javascript = ['eslint', 'prettier']
endif
let g:javascript_plugin_flow = 1

" General completion & linting setup
let g:asyncomplete_smart_completion = 1
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_remove_duplicates = 1
let g:ale_c_parse_compile_commands = 1
imap <c-space> <Plug>(asyncomplete_force_refresh)
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif
set pumheight=10

" ctrlp
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_max_files=0
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files'],
    \ },
  \ 'fallback': 'find %s -type f'
  \ }

" Go
let g:go_def_mode='gopls'
call asyncomplete#register_source(asyncomplete#sources#gocode#get_source_options({
    \ 'name': 'gocode',
    \ 'whitelist': ['go'],
    \ 'completor': function('asyncomplete#sources#gocode#completor'),
    \ 'config': {
    \    'gocode_path': expand('~/go/bin/gocode')
    \  },
    \ }))

" General vim options
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set clipboard=unnamed
set hidden
set number
set cursorline

" Colorscheme
set termguicolors
let g:material_theme_style = 'darker'
colorscheme material
:AirlineTheme wombat

:highlight Pmenu ctermbg=gray guibg=gray

