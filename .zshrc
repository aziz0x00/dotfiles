#
# Aziz's ~/.zshrc
#


HISTSIZE=1000 SAVEHIST=10000
[ -z $HISTFILE ] && HISTFILE=~/.histfile 
alias rm='rm -iv'

source ~/.config/zsh/rc
source ~/.config/zsh/aliases
source ~/.config/zsh/funcs
source ~/.config/zsh/binds

autoload colors;colors
[ -z $WINDOWID ] && c='>' || c='❯'
PS1="%(?.%{$fg[green]%}.%{$fg[red]%}) $c %{$fg[white]%}"
export FZF_DEFAULT_OPTS="--color=16,prompt:2,bg+:-1 --prompt='$c ' --pointer='$c '"
unset colors c
export FZF_CTRL_T_COMMAND='find ~/* * .* \( -type d -a \( -name .git -o -name .cache \) -prune \) -o -print'

source /usr/share/fzf/key-bindings.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /etc/grc.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
