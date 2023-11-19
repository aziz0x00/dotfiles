set -gx LESS '-R'
set -gx LESS_TERMCAP_md (set_color -o blue)
set -gx LESS_TERMCAP_se (set_color normal)
set -gx LESS_TERMCAP_so (set_color -o black -b blue)

set -gx BAT_STYLE numbers
set -gx BAT_THEME base16

set -gx FZF_DEFAULT_OPTS "--color=16,prompt:6,bg+:-1 --margin 0,1,0 --prompt='❯ ' --pointer='>' --marker='▪'"

set -gax PATH ~/.local/share/gem/ruby/3.0.0/bin/
