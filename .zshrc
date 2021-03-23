#
# Aziz's ~/.zshrc
#

HISTFILE=~/.histfile HISTSIZE=1000 SAVEHIST=10000
alias rm='rm -iv'

source ~/.config/zsh/rc
source ~/.config/zsh/aliases
source ~/.config/zsh/funcs
source ~/.config/zsh/binds

echo -n '\e[5 q'
autoload colors;colors
PS1="%(?.%{$fg[green]%}.%{$fg[red]%}) ❯ "
unset colors

source /usr/share/fzf/key-bindings.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
