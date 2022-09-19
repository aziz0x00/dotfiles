#alias rm='rm -iv' # important
rm () {
    echo are you crazy
}
alias _please_remove='/bin/rm -iv'

# the actual configs
source ~/.config/zsh/binds
source ~/.config/zsh/rc
source ~/.config/zsh/aliases
source ~/.config/zsh/funcs
source ~/.config/zsh/env

# extensions
source /usr/share/fzf/key-bindings.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /etc/grc.zsh
source ~/.local/share/zsh/plugins/fsh/fast-syntax-highlighting.plugin.zsh
