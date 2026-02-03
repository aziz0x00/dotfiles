## bind -M <vimode> <key> <command>


# <3
bind \cV history_sessions_switcher
bind -M insert \cV history_sessions_switcher

# clear history C-x
bind \cX 'history clear-session; commandline -f repaint'
bind -M insert \cX 'history clear-session; commandline -f repaint'

# S-Tab to accept completion
bind -M insert shift-tab accept-autosuggestion

# tmux messes this one
bind -M insert alt-backspace backward-kill-word
