" vi:syntax=vim

" base16-vim (https://github.com/chriskempson/base16-vim)
" by Chris Kempson (http://chriskempson.com)
" Default Dark scheme by Chris Kempson (http://chriskempson.com)

" Terminal color definitions
let s:cterm00  = "00"
let s:cterm01  = "00"
let s:cterm02  = "11"
let s:cterm03  = "08"
let s:cterm04  = "12"
let s:cterm05  = "07"
let s:cterm06  = "13"
let s:cterm07  = "15"
let s:cterm08  = "01"
let s:cterm09  = "09"
let s:cterm0A  = "03"
let s:cterm0B  = "02"
let s:cterm0C  = "06"
let s:cterm0D  = "04"
let s:cterm0E  = "05"
let s:cterm0F  = "14"

" Neovim terminal colours
let g:terminal_ansi_colors = [
  \ "#1d1f21",
  \ "#cc6666",
  \ "#b5bd68",
  \ "#f0c674",
  \ "#81a2be",
  \ "#b294bb",
  \ "#8abeb7",
  \ "#c5c8c6",
  \ "#666666",
  \ "#d54e53",
  \ "#b9ca4a",
  \ "#e7c547",
  \ "#7aa6da",
  \ "#c397d8",
  \ "#70c0b1",
  \ "#eaeaea",
  \ ]


" Vim editor colors
hi Bold cterm=bold
hi Debug ctermfg=01
hi Directory ctermfg=04
hi Error ctermfg=00 ctermbg=01
hi ErrorMsg ctermfg=01 ctermbg=00
hi Exception ctermfg=01
hi FoldColumn ctermfg=06 ctermbg=00
hi Folded ctermfg=08 ctermbg=00
hi IncSearch ctermfg=00 ctermbg=09 cterm=none
hi Italic cterm=none
hi Macro ctermfg=01
hi MatchParen ctermbg=08
hi ModeMsg ctermfg=02
hi MoreMsg ctermfg=02
hi Question ctermfg=04
hi Search ctermfg=00 ctermbg=03
hi Substitute ctermfg=00 ctermbg=03 cterm=none
hi SpecialKey ctermfg=08
hi TooLong ctermfg=01
hi Underlined ctermfg=01
hi Visual ctermbg=238
hi VisualNOS ctermfg=01
hi WarningMsg ctermfg=01
hi WildMenu ctermfg=00
hi Title ctermfg=04 cterm=none
hi Conceal ctermfg=04 ctermbg=00
hi Cursor ctermfg=00 ctermbg=07
hi CursorLineNr ctermfg=245
hi NonText ctermfg=08
hi LineNr ctermfg=08
hi SignColumn ctermfg=08 ctermbg=00
hi StatusLine ctermfg=00 ctermbg=07 cterm=none
hi StatusLineNC ctermfg=08 ctermbg=00 cterm=none
hi VertSplit ctermfg=14 ctermbg=none cterm=none
hi QuickFixLine ctermbg=00 cterm=none
hi PMenu ctermfg=07 ctermbg=00 cterm=none
hi PMenuSel ctermfg=00 ctermbg=07
hi TabLine ctermfg=08 ctermbg=00 cterm=none
hi TabLineFill ctermfg=08 ctermbg=00 cterm=none
hi TabLineSel ctermfg=02 ctermbg=00 cterm=none

" Standard syntax highlighting
hi Boolean ctermfg=09
hi Character ctermfg=01
hi Comment ctermfg=08
hi Conditional ctermfg=13
hi Exception ctermfg=13
hi Constant ctermfg=09
hi Define ctermfg=05 cterm=none
hi Delimiter ctermfg=14
hi Float ctermfg=09
hi Function ctermfg=14
hi Identifier ctermfg=7 cterm=none
hi Include ctermfg=05
hi Keyword ctermfg=14
hi Label ctermfg=03
hi Number ctermfg=09
hi Operator ctermfg=05
hi PreProc ctermfg=05
hi Repeat ctermfg=05
hi Special ctermfg=06
hi SpecialChar ctermfg=14
hi Statement ctermfg=05
hi StorageClass ctermfg=05
hi String ctermfg=02
hi Structure ctermfg=14
hi Tag ctermfg=03
hi Todo ctermfg=03 ctermbg=00
hi Type ctermfg=14 cterm=none
hi Typedef ctermfg=03

" C highlighting
hi cOperator ctermfg=06
hi cPreCondit ctermfg=05

" C# highlighting
hi csClass ctermfg=03
hi csAttribute ctermfg=03
hi csModifier ctermfg=05
hi csType ctermfg=01
hi csUnspecifiedStatement ctermfg=04
hi csContextualStatement ctermfg=05
hi csNewDecleration ctermfg=01

" CSS highlighting
hi cssBraces ctermfg=07
hi cssClassName ctermfg=05
hi cssColor ctermfg=06

" Diff highlighting
hi DiffAdd ctermfg=02 ctermbg=00
hi DiffChange ctermfg=08 ctermbg=00
hi DiffDelete ctermfg=01 ctermbg=00
hi DiffText ctermfg=04 ctermbg=00
hi DiffAdded ctermfg=02 ctermbg=00
hi DiffFile ctermfg=01 ctermbg=00
hi DiffNewFile ctermfg=02 ctermbg=00
hi DiffLine ctermfg=04 ctermbg=00
hi DiffRemoved ctermfg=01 ctermbg=00

" Git highlighting
hi gitcommitOverflow ctermfg=01
hi gitcommitSummary ctermfg=02
hi gitcommitComment ctermfg=08
hi gitcommitUntracked ctermfg=08
hi gitcommitDiscarded ctermfg=08
hi gitcommitSelected ctermfg=08
hi gitcommitHeader ctermfg=05
hi gitcommitSelectedType ctermfg=04
hi gitcommitUnmergedType ctermfg=04
hi gitcommitDiscardedType ctermfg=04
hi gitcommitBranch ctermfg=09 cterm=bold
hi gitcommitUntrackedFile ctermfg=03
hi gitcommitUnmergedFile ctermfg=01 cterm=bold
hi gitcommitDiscardedFile ctermfg=01 cterm=bold
hi gitcommitSelectedFile ctermfg=02 cterm=bold

" GitGutter highlighting
hi GitGutterAdd ctermfg=02 ctermbg=00
hi GitGutterChange ctermfg=04 ctermbg=00
hi GitGutterDelete ctermfg=01 ctermbg=00
hi GitGutterChangeDelete ctermfg=05 ctermbg=00

" HTML highlighting
hi htmlBold ctermfg=03
hi htmlItalic ctermfg=05
hi htmlEndTag ctermfg=07
hi htmlTag ctermfg=07

" JavaScript highlighting
hi javaScript ctermfg=07
hi javaScriptBraces ctermfg=07
hi javaScriptNumber ctermfg=09
" pangloss/vim-javascript highlighting
hi jsOperator ctermfg=04
hi jsStatement ctermfg=05
hi jsReturn ctermfg=05
hi jsThis ctermfg=01
hi jsClassDefinition ctermfg=03
hi jsFunction ctermfg=05
hi jsFuncName ctermfg=04
hi jsFuncCall ctermfg=04
hi jsClassFuncName ctermfg=04
hi jsClassMethodType ctermfg=05
hi jsRegexpString ctermfg=06
hi jsGlobalObjects ctermfg=03
hi jsGlobalNodeObjects ctermfg=03
hi jsExceptions ctermfg=03
hi jsBuiltins ctermfg=03

" Mail highlighting
hi mailQuoted1 ctermfg=03
hi mailQuoted2 ctermfg=02
hi mailQuoted3 ctermfg=05
hi mailQuoted4 ctermfg=06
hi mailQuoted5 ctermfg=04
hi mailQuoted6 ctermfg=03
hi mailURL ctermfg=04
hi mailEmail ctermfg=04

" Markdown highlighting
hi markdownCode ctermfg=02
hi markdownError ctermfg=07 ctermbg=00
hi markdownCodeBlock ctermfg=02
hi markdownHeadingDelimiter ctermfg=04

" NERDTree highlighting
hi NERDTreeDirSlash ctermfg=04
hi NERDTreeExecFile ctermfg=07

" PHP highlighting
hi phpMemberSelector ctermfg=07
hi phpComparison ctermfg=07
hi phpParent ctermfg=07
hi phpMethodsVar ctermfg=07

" Python highlighting
hi pythonOperator ctermfg=05
hi pythonRepeat ctermfg=05
hi pythonInclude ctermfg=05
hi pythonStatement ctermfg=05

" Ruby highlighting
hi rubyAttribute ctermfg=04
hi rubyConstant ctermfg=03
hi rubyInterpolationDelimiter ctermfg=14
hi rubyRegexp ctermfg=06
hi rubySymbol ctermfg=02
hi rubyStringDelimiter ctermfg=02

" SASS highlighting
hi sassidChar ctermfg=01
hi sassClassChar ctermfg=09
hi sassInclude ctermfg=05
hi sassMixing ctermfg=05
hi sassMixinName ctermfg=04

" Signify highlighting
hi SignifySignAdd ctermfg=02 ctermbg=00
hi SignifySignChange ctermfg=04 ctermbg=00
hi SignifySignDelete ctermfg=01 ctermbg=00

" Spelling highlighting
hi SpellBad cterm=undercurl
hi SpellLocal cterm=undercurl
hi SpellCap cterm=undercurl
hi SpellRare cterm=undercurl

" Startify highlighting
hi StartifyBracket ctermfg=08
hi StartifyFile ctermfg=15
hi StartifyFooter ctermfg=08
hi StartifyHeader ctermfg=02
hi StartifyNumber ctermfg=09
hi StartifyPath ctermfg=08
hi StartifySection ctermfg=05
hi StartifySelect ctermfg=06
hi StartifySlash ctermfg=08
hi StartifySpecial ctermfg=08

" Java highlighting
hi javaOperator ctermfg=04

