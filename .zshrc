alias rm='rm -iv' # important

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
curl () {
    /bin/curl $@ -i --path-as-is
}
source ~/.local/share/zsh/plugins/fsh/fast-syntax-highlighting.plugin.zsh
