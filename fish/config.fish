if status is-login
    and not set -q TMUX # tmux behaves like a login shell all the time

    set -xg TERMINAL alacritty
    set -xg BROWSER qutebrowser
    set -xg EDITOR nvim
    set -xg PAGER less
    set -xg GOATH ~/.local/go

    set -xg PATH ~/.local/scripts/ ~/.local/bin ~/.local/flutter/bin $PATH "$GOPATH/bin" ~/.local/share/gem/ruby/*/bin
    set -xg XDG_CONFIG_HOME ~/.config/
    set -xg XDG_CACHE_HOME ~/.cache/
    set -xg XDG_STATE_HOME ~/.local/state/
    set -xg XDG_DATA_HOME ~/.local/share/

    # launch X server on when logged on tty1, or tmux when logged elsewhere
    test (tty) = '/dev/tty1'
    and exec startx
    or exec tmux new -s (string split / (tty))[3]
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    source /etc/grc.fish
    source /usr/share/fish/vendor_functions.d/fzf_key_bindings.fish && fzf_key_bindings

    source $__fish_config_dir/interactive/main.fish
end
