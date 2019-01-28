call plug#begin('~/.vim/plugged')
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-flow.vim'
Plug 'pangloss/vim-javascript'
Plug 'w0rp/ale'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
call plug#end()

" C/C++ completion
if executable('clangd')
	au User lsp_setup call lsp#register_server({
				\ 'name': 'clangd',
				\ 'cmd': {server_info->['clangd']},
				\ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
				\ })
endif

" Javascript / Flow setup
if executable('flow')
	au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#flow#get_source_options({
				\ 'name': 'flow',
				\ 'whitelist': ['javascript'],
				\ 'completor': function('asyncomplete#sources#flow#completor'),
				\ }))
	let g:ale_linters = { 
				\'javascript': ['flow', 'eslint'],
				\}
	let g:ale_fixers = {
				\'javascript': ['eslint'],
				\}
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
tnoremap <Esc> <C-\><C-n>
set pumheight=10

" ctrlp
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_max_files=0

" General vim options
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set clipboard=unnamed
set hidden
colorscheme peachpuff
