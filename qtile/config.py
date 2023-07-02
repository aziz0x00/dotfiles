from os import system

from mods.colors import *
from mods.floating import *
from mods.groups import *
from mods.keys import *
from mods.screens import *


system("xsetroot -cursor_name left_ptr")
terminal = "alacritty"

for i in groups:
    keys.extend(
        [
            # M1 + letter of group = switch to group
            Key(
                [M],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # M1 + shift + letter of group = switch to & move focused window to group
            Key(
                [M, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # M1 + shift + letter of group = move focused window to group
            # Key([M, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )


groups.append(
    ScratchPad(
        "scratch",
        [
            DropDown(
                "term", "alacritty -e tmux new -As Scratch -e fish_history=ScratchPad"
            ),
            DropDown(
                "htop",
                "alacritty -t htop -e htop",
                height=0.9,
                width=0.8,
                x=0.1,
                y=0.01,
                on_focus_lost_hide=True,
                opacity=0.95,
                warp_pointer=True,
            ),
            DropDown(
                "my-running-memo",
                "alacritty -t memo -e nvim -i NONE .my-running-memo.md",
                height=1,
                width=0.4,
                x=0.6,
                y=0,
                on_focus_lost_hide=True,
                opacity=0.95,
                warp_pointer=True,
            ),
        ],
    )
)

layouts = [
    layout.Max(),
    layout.Columns(
        border_focus=color[3],
        border_normal=color[8],
        border_on_single=True,
        border_width=1,
        margin=3,
        margin_on_single=[30, 100, 30, 100],
        grow_amount=5,
    ),
]

widget_defaults = dict(
    font="sans",
    fontsize=16,
    padding=6,
)
extension_defaults = widget_defaults.copy()


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
