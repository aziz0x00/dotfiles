# fish_git_prompt vars
set __fish_git_prompt_showdirtystate 1
set __fish_git_prompt_showcolorhints 1
set __fish_git_prompt_showstashstate 1
set __fish_git_prompt_color_branch magenta
set __fish_git_prompt_color_prefix white
set __fish_git_prompt_color_suffix white

function fish_prompt
    set -l __last_command_exit_status $status

    set -l cyan (set_color -o cyan)
    set -l yellow (set_color -o yellow)
    set -l blue (set_color -o blue)
    set -l normal (set_color normal)

    set -l ired (set_color -o -i red)
    set -l igreen (set_color -o -i green)

    set -l arrow_color $igreen
    if test $__last_command_exit_status != 0
        set arrow_color $ired
    end

    set -l arrow "$arrow_color λ"
    if fish_is_root_user
        set arrow "$arrow_color #"
    end

    set -l cwd $cyan(basename (prompt_pwd))$normal

    echo -n -s ' '$cwd (fish_git_prompt) $arrow ' ' $normal
end

