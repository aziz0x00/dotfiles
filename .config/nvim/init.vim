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
" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Perform dot commands over visual blocks
vnoremap . :normal .<CR>

set splitbelow splitright

map <leader>n :NERDTreeToggle<CR>

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"let g:colorizer_auto_color=1
"set cursorline
set noshowmode
set noruler
set laststatus=0
let g:airline_theme='base16'
filetype plugin on
syntax on
colorscheme my_base16

map \b :,!sed<Space>-z<Space>'s/\n$//'<Bar>base64<Return>
map \B :,!base64<Space>-d<Return>
map <Leader>cC :ColorToggle<Return>
