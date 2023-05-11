# <3
bind \cV history_sessions_switcher
bind -M insert \cV history_sessions_switcher

# clear history C-x
bind \cX 'history clear-session; commandline -f repaint'
bind -M insert \cX 'history clear-session; commandline -f repaint'

# S-Tab to accept completion
bind -M insert -k btab 'commandline -f accept-autosuggestion'
