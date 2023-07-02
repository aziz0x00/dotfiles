from libqtile.config import Key, Drag, Click
from libqtile.lazy import lazy


A = "mod1"
M = "mod4"

keys = [
    # Switch between windows
    Key([M], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([M], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([M], "j", lazy.layout.down(), desc="Move focus down"),
    Key([M], "k", lazy.layout.up(), desc="Move focus up"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([M, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key(
        [M, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"
    ),
    Key([M, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([M, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([M, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([M, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([M, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([M, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([M], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [M],
        "BackSpace",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([M], "Return", lazy.spawn("alacritty"), desc="Launch terminal"),
    # Key(
    #     [M, "shift"],
    #     "Return",
    #     lazy.spawn("alacritty -e tmux a"),
    #     desc="Launch terminal",
    # ),

    # Toggle between different layouts as defined below
    Key([M], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([M], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([M, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([M], "f", lazy.window.toggle_floating()),
    # mine
    Key([M], "b", lazy.spawn("qutebrowser")),
    Key([M], "v", lazy.spawn("wireshark")),
    #    Key([M, 'shift'], "c", lazy.spawn('edit-clip p')),
    Key([A], "bracketright", lazy.screen.next_group()),
    Key([A], "bracketleft", lazy.screen.prev_group()),
    Key([A], "backslash", lazy.screen.toggle_group()),
    # volume & brightness
    Key(
        [],
        "XF86AudioLowerVolume",
        lazy.spawn(
            "bash -c \"amixer set Master 1%-; dunstify -t 800 -u low -r 1 Volume $(amixer get Master|tail -1|awk -F'[][]' '{print $2}')\""
        ),
    ),
    Key(
        [],
        "XF86AudioRaiseVolume",
        lazy.spawn(
            "bash -c \"amixer set Master 1%+; dunstify -t 800 -u low -r 1 Volume $(amixer get Master|tail -1|awk -F'[][]' '{print $2}')\""
        ),
    ),
    Key([], "XF86AudioMute", lazy.spawn("bash -c \"amixer set Master toggle; dunstify -t 800 -u low -r 1 Volume $(amixer get Master|tail -1|awk -F'[][]' '{print $4}')\"")),
    Key(
        [],
        "XF86MonBrightnessDown",
        lazy.spawn(
            'bash -c "xbacklight -dec 5; dunstify -t 800 -u low -r 2 Brightness $(xbacklight -get)"'
        ),
    ),
    Key(
        [],
        "XF86MonBrightnessUp",
        lazy.spawn(
            'bash -c "xbacklight -inc 5; dunstify -t 800 -u low -r 2 Brightness $(xbacklight -get)"'
        ),
    ),
    # screenshot
    Key(
        [], "Print", lazy.spawn("bash -c 'maim -s $(date +\"%Y-%m-%d-%H:%M:%N.png\")'")
    ),
    Key(
        ["shift"],
        "Print",
        lazy.spawn("bash -c 'maim $(date +\"%Y-%m-%d-%H:%M:%N.png\")'"),
    ),
    #    Key(['control'], 'space', lazy.spawn('dunstctl close')),
    #    Key(['control', 'shift'], 'space', lazy.spawn('dunstctl close-all')),
    #    Key(['control'], 'grave', lazy.spawn('dunstctl history-pop')),
    #    Key([], 'XF86UWB', lazy.spawn('sudo rfkill toggle wlan')),
    Key([M], "p", lazy.spawn("betterlockscreen -l dim")),
]

keys.append(Key([], "F10", lazy.group["scratch"].dropdown_toggle("term")))
keys.append(Key([], "F1", lazy.group["scratch"].dropdown_toggle("htop")))
keys.append(Key([A], "F7", lazy.group["scratch"].dropdown_toggle("my-running-memo")))

# Drag floating layouts.
mouse = [
    Drag(
        [M],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag([M], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([M], "Button2", lazy.window.bring_to_front()),
]

