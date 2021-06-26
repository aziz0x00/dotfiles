"
" My VIMRC <3
"

source $VIMRUNTIME/defaults.vim

set backup
set undofile
set hlsearch

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif
se mouse=n
let g:airline_theme='base16color'

map \b :,!sed<Space>-z<Space>'s/\n$//'<Bar>base64<Return>
map \B :,!base64<Space>-d<Return>
