useradd aziz -Gwheel,video
mkdir -p ~/.config/{dunst,zathura} ~/.histfiles
ln -s ~/.cache/wal/dunstrc ~/.config/dunst/dunstrc
ln -s ~/.cache/wal/zathurarc ~/.config/zathura/zathurarc

git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ~/.local/share/zsh/plugins/fsh/
