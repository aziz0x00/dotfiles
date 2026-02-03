set -gx LESS '-R'
set -gx LESS_TERMCAP_md (set_color -o blue)
set -gx LESS_TERMCAP_se (set_color normal)
set -gx LESS_TERMCAP_so (set_color -o black -b blue)
set -gx GROFF_NO_SGR 1



set -gx BAT_STYLE numbers
set -gx BAT_THEME base16

set -gx FZF_DEFAULT_OPTS "--prompt='❯ '"

set -gax PATH ~/.local/share/gem/ruby/3.0.0/bin/

# set -gx JAVA_HOME /usr/lib/jvm/java-23-openjdk/
