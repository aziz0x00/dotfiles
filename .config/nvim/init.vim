call plug#begin()
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'sainnhe/gruvbox-material'
Plug 'windwp/nvim-autopairs'
Plug 'itchyny/lightline.vim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot'
call plug#end()

lua << EOF
require("nvim-tree").setup {}
require("nvim-autopairs").setup {}
vim.opt.list = true
require("indent_blankline").setup {}
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

map <leader>o :NvimTreeToggle<CR>
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
let b:ale_linters = ['pylint', 'eslint']
let b:ale_fixers = ['autopep8', 'yapf']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_disable_lsp = 1
let g:ale_floating_window_border = repeat([''], 8)

hi ALEErrorSign ctermfg=09 ctermbg=none
hi ALEWarningSign ctermfg=3 ctermbg=none

" LightLine
let g:lightline = {'colorscheme': 'gruvbox_material'}

" my custom stuff
map \b :,!sed -z 's/\n$//'<Bar>base64 -w 0<Return>
map \B :,!base64 -d<Return>
map \u :,!php -r 'echo urlencode(file_get_contents("php://stdin"));'<Return>
map \U :,!php -r 'echo urldecode(file_get_contents("php://stdin"));'<Return>
"map <Leader>cC :ColorToggle<Return> "this is slow and should be changed