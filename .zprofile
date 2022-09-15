#
# ~/.zprofile
#

#source /etc/profile # sourceing everything in a directory is stupid
source /etc/profile.d/locale.sh
#source /etc/profile.d/perlbin.sh
PATH=$PATH:/bin/vendor_perl

export TERMINAL=alacritty
export BROWSER=qutebrowser
export EDITOR=nvim
export PAGER=less
export GOPATH=~/.local/go
export PATH=~/.local/bin:~/.local/flutter/bin:$PATH:$GOPATH/bin
export XDG_CONFIG_HOME=~/.config

[ `tty` = '/dev/tty1' ] && exec startx || [ -z $TMUX ] && exec tmux
