#!/bin/bash

myname=aziz


# helper
function info() { echo '[i]' $@; }

# stage 1
function sys_conf() {

    info 'adding user'
    useradd $myname -m
    usermod $myname -aG $myname,wheel

    info 'user created! set password:'
    passwd $myname

    info 'installing yay'
    git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -sri && cd .. && rm yay -rf 2>/dev/null

    info 'installing pkglist.txt'
    yay -S `cat .packages/pkglist.txt `

    info 'copying to /etc'
    cp -r .etc/* /etc -rv

    usermod $myname -aG wireshark,docker,input,video


    # make coredumps accessable in containers:
    mkdir /var/crash
    sysctl kernel.core_pattern='/var/crash/core.%E.%h.%p'
    sysctl kernel.core_uses_pid=0
}


# stage 2
function user_conf() {

    info 'copying configs'
    mkdir -p ~/.config/{dunst,zathura}
    ln -s ~/.cache/wal/dunstrc ~/.config/dunst/dunstrc
    ln -s ~/.cache/wal/zathurarc ~/.config/zathura/zathurarc
    cp -r '~homedir/*' ~
    cp -r `find -maxdepth 1 -type d \! -name .\*` ~/.config/

    info 'installing python-pkhlist.txt'
    pip install -r ./.packages/python-pkglist.txt
}


[[ $UID -ne 0 ]] && echo 'ERROR: not root' && exit 1

info 'starting system configs'
sys_conf

su - $myname

info 'starting user configs'
user_conf

info 'FINISHED :D'
