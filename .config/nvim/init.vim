call plug#begin()
Plug 'sheerun/vim-polyglot'
Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'sainnhe/gruvbox-material'
Plug 'windwp/nvim-autopairs'
Plug 'dense-analysis/ale'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'tommcdo/vim-lion'
Plug 'ntpeters/vim-better-whitespace'
call plug#end()

lua << EOF
require("nvim-tree").setup()
require("nvim-autopairs").setup {}
EOF

let mapleader=","
autocmd BufReadPost * normal g`"
set nocompatible
set title
set go=a
set mouse=a
set hlsearch
set clipboard+=unnamedplus
set tabstop=4
set shiftwidth=4
set expandtab
set undofile
set number relativenumber
set noeol nofixeol " noeol is pain :(
" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Perform dot commands over visual blocks
vnoremap . :normal .<CR>

set splitbelow splitright

map <leader>n :NERDTreeToggle<CR>
map <leader>t :tabnew<CR>

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

set noshowmode
set noruler
set laststatus=2
filetype plugin on
syntax on
colorscheme gruvbox-material
hi Normal ctermbg=none
hi EndOfBuffer ctermbg=none

" ALE
let b:ale_linters = ['pylint']
let b:ale_fixers = ['autopep8', 'yapf']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_disable_lsp = 1
let g:ale_floating_window_border = repeat([''], 8)

hi ALEErrorSign ctermfg=09 ctermbg=none
hi ALEWarningSign ctermfg=3 ctermbg=none

" LightLine
let g:lightline = {
	\ 'colorscheme': 'Tomorrow_Night_Bright',
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
	\ },
	\ 'component_function': {
	\   'cocstatus': 'coc#status'
	\ },
	\ }

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" Coc SUPERMAGIC
nmap <F2> <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
autocmd CursorHold * silent call CocActionAsync('highlight')
" thanks to jdh https://gist.github.com/jdah/4b4d98c2ced36eb07b017c4ae2c94bab :
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <TAB>  pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" my custom stuff
map \b :,!sed -z 's/\n$//'<Bar>base64 -w 0<Return>
map \B :,!base64 -d<Return>
map \u :,!php -r 'echo urlencode(file_get_contents("php://stdin"));'<Return>
map \U :,!php -r 'echo urldecode(file_get_contents("php://stdin"));'<Return>
"map <Leader>cC :ColorToggle<Return> "this is slow and should be changed
