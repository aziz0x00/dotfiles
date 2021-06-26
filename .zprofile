#
# ~/.zprofile
#

#source /etc/profile # sourceing everything in a directory is stupid
source /etc/profile.d/locale.sh
#source /etc/profile.d/perlbin.sh
PATH=$PATH:/bin/vendor_perl

export TERMINAL=alacritty
export BROWSER=qutebrowser
export EDITOR=vim
export PAGER=less
export GOPATH=~/.local/go
export PATH=~/.local/bin:$PATH:$GOPATH/bin
export BAT_STYLE=numbers BAT_THEME=base16


[ `tty` = '/dev/tty1' ] && exec startx || [ -z $TMUX ] && exec tmux
