from typing import List  # noqa: F401

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

from os import getenv

color = [] # 0:bg, 7:fg
with open(getenv('HOME')+'/.cache/wal/colors') as f:
    for c in f.read().splitlines():
        color.append(c)

A = 'mod1'
M = "mod4"
terminal = 'alacritty'

keys = [
    # Switch between windows
    Key([M], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([M], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([M], "j", lazy.layout.down(), desc="Move focus down"),
    Key([M], "k", lazy.layout.up(), desc="Move focus up"),
    Key([M], "space", lazy.layout.next(),
        desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([M, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([M, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([M, "shift"], "j", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([M, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([M, "control"], "h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([M, "control"], "l", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([M, "control"], "j", lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([M, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([M], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([M], "BackSpace", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),
    Key([M], "Return", lazy.spawn('alacritty'), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([M], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([M], "q", lazy.window.kill(), desc="Kill focused window"),

    Key([M, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([M], "f", lazy.window.toggle_floating()),


    # mine
    Key([M], "b", lazy.spawn('qutebrowser')),
    Key([M], "d", lazy.spawn('qstardict')),
    Key([M], "o", lazy.spawn('open-rofi')),
    Key([M], "p", lazy.spawn('alacritty -t htop -e htop')),
    Key([M], "e", lazy.spawn('alacritty -t "lf - file manager" -e lf')),
    Key([M], "g", lazy.spawn('rofi -show window -show-icons -theme ~/.cache/wal/rofi')),

    Key([A], 'bracketright', lazy.screen.next_group()),
    Key([A], 'bracketleft', lazy.screen.prev_group()),
    # volume & brightness
    Key([], 'XF86AudioLowerVolume', lazy.spawn("bash -c \"amixer set Master 1%-; dunstify -t 400 -u low -r 1 Volume $(amixer get Master|tail -1|awk -F'[][]' '{print $2}')\"")),
    Key([], 'XF86AudioRaiseVolume', lazy.spawn("bash -c \"amixer set Master 1%+; dunstify -t 400 -u low -r 1 Volume $(amixer get Master|tail -1|awk -F'[][]' '{print $2}')\"")),
    Key([], 'XF86AudioMute', lazy.spawn("amixer set Master toggle")),

    Key([], 'XF86MonBrightnessDown', lazy.spawn("bash -c \"xbacklight -dec 5; dunstify -t 400 -u low -r 1 Brightness $(xbacklight -get)\"")),
    Key([], 'XF86MonBrightnessUp', lazy.spawn("bash -c \"xbacklight -inc 5; dunstify -t 400 -u low -r 1 Brightness $(xbacklight -get)\"")),

    # screenshot
    Key([], 'Print', lazy.spawn("bash -c 'maim -s $(date +\"%Y-%m-%d-%H:%M:%N.png\")'")),
    Key(['shift'], 'Print', lazy.spawn("bash -c 'maim $(date +\"%Y-%m-%d-%H:%M:%N.png\")'")),

    Key(['control'], 'space', lazy.spawn('dunstctl close')),
    Key(['control', 'shift'], 'space', lazy.spawn('dunstctl close-all')),
#    Key(['control'], 'grave', lazy.spawn('dunstctl history-pop')),
]

groups = [Group(name=str(i+1), label=l) for i, l in \
        enumerate(('general', 'code', 'web', 'etc'))]

for i in groups:
    keys.extend([
        # M1 + letter of group = switch to group
        Key([M], i.name, lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        # M1 + shift + letter of group = switch to & move focused window to group
        Key([M, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name)),
        # Or, use below if you prefer not to switch to that group.
        # # M1 + shift + letter of group = move focused window to group
        # Key([M, "shift"], i.name, lazy.window.togroup(i.name),
        #     desc="move focused window to group {}".format(i.name)),
    ])

layouts = [
    layout.Columns(border_focus=color[2], border_normal=color[8],\
            border_on_single=True, border_width=1, margin=6),
    layout.Max(),
]

widget_defaults = dict(
    font='sans',
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayoutIcon(scale=.6, background=color[4]+'cc'),
                widget.GroupBox(highlight_method='line', disable_drag=True,\
                        highlight_color=[color[4]+'20']*2,\
                        this_current_screen_border=color[4]+'80',\
                        active=color[15], inactive=color[8], margin_x=0),
                widget.WindowName(foreground='#ffffff',\
                        background=color[4]+'cc',\
                        fontsize=13, padding=4),
                widget.Wlan(interface='wlp3s0', disconnected_message='',\
                        foreground=color[7]),
                widget.Net(foreground=color[7]+'90'),
                widget.NetGraph(border_width=0, line_width=1,\
                    graph_color=color[4]+'cc', fill_color=color[4]+'70'),
                widget.Sep(foreground=color[4]+'cc', size_percent=100),
                widget.Battery(format=' {percent:2.0%}'),
                widget.Sep(foreground=color[4]+'cc', size_percent=100),
                widget.Clock(format=' %a, %b %d - %R '),
            ],
            26,
            background=color[0]+'cc'
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([M], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([M], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([M], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='qstardict'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
], border_focus=color[2], border_normal=color[8])
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
