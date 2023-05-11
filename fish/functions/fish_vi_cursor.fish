# I updated this function so I can have Beam cursor by default on executed programs.
#  deleted many checks to make it run faster, this works for any xterm (I use alacritty)
#  the original function can still be found at /usr/share/fish/functions/fish_vi_cursor.fish
function fish_vi_cursor -d 'Set cursor shape for different vi modes'
    # If we're not interactive, there is effectively no bind mode.
    if not status is-interactive
        return
    end

    set -l function __fish_cursor_xterm

    set -q fish_cursor_unknown
    or set -g fish_cursor_unknown block

    echo "
          function fish_vi_cursor_handle --on-variable fish_bind_mode --on-event fish_postexec --on-event fish_focus_in
              set -l varname fish_cursor_\$fish_bind_mode
              if not set -q \$varname
                set varname fish_cursor_unknown
              end
              $function \$\$varname
          end
         " | source

    echo "
          function fish_vi_cursor_handle_preexec --on-event fish_preexec
              set -l varname fish_cursor_insert
              if not set -q \$varname
                set varname fish_cursor_unknown
              end
              $function \$\$varname
          end
         " | source
end
