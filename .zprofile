#
# ~/.zsh_profile
#

export TERMINAL=urxvt
export BROWSER=qutebrowser
export EDITOR=vim
export PAGER=less
export GOPATH=~/.local/go
export PATH=~/.local/bin:$PATH:$GOPATH/bin
export BAT_STYLE=numbers BAT_THEME=base16
export LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8

[ `tty` = '/dev/tty1' ] && startx # (startx || true) || tmux
