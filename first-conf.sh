useradd aziz -Gwheel,video
mkdir -p ~/.local/share/themes/Az1z/openbox-3 ~/.config/{dunst,zathura,conky} ~/.histfiles
ln -s ~/.cache/wal/themerc ~/.local/share/themes/Az1z/openbox-3/
ln -s ~/.cache/wal/dunstrc ~/.config/dunst/dunstrc
ln -s ~/.cache/wal/zathurarc ~/.config/zathura/zathurarc
ln -s ~/.cache/wal/conky.conf ~/.config/conky/conky.conf

# transparent zathura from https://gist.github.com/miseran/0ea4b95e9816bf915b7b7171a5a0e42d
