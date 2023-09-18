abbr vi nvim
alias 0vi='nvim -i NONE --noplugin'
alias ls=exa
alias l='ls -la'
alias yay='yay --color=auto'
alias grep='grep --color=auto'
alias cp='cp -iv'
alias mv='mv -iv'
alias py=python
alias L=less
alias df='grc df -hT'
alias cl='xclip -o'
alias clc='xclip -o -sel clip'
alias b64=base64
alias b64d='b64 -d'
alias nc='ncat'
alias cp='rsync -ah --inplace --progress'
alias pwninit='pwninit --template-path ~/.config/pwninit-template.py --template-bin-name e'
#alias curl='curl -i --path-as-is' # not working with -q
function curl
    /bin/curl $argv --path-as-is
end
