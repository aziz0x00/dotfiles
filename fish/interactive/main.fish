set -l cwd $__fish_config_dir/interactive

source $cwd/prompt.fish
source $cwd/aliases.fish
source $cwd/funs.fish
source $cwd/env.fish
source $cwd/binds.fish


set fish_cursor_default block blink
set fish_cursor_insert line blink
set fish_cursor_replace_one underscore blink
function fish_mode_prompt; end

function fish_greeting; end

# rm :')
function rm --description='NO!'
    echo "are you crazy?"
end
alias _please_remove='/bin/rm -iv'
