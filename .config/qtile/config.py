from os     import system

from mods.colors   import *
from mods.floating import *
from mods.groups   import *
from mods.keys     import *
from mods.screens  import *


system('xsetroot -cursor_name left_ptr')
terminal = 'alacritty'

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


groups.append(
    ScratchPad("ScratPad", [DropDown('term', 'alacritty')])
)

layouts = [
    layout.Columns(border_focus=color[2], border_normal=color[8],\
            border_on_single=True, border_width=1, margin=6,\
            margin_on_single=[30, 100, 30, 100], grow_amount=5),
    layout.Max()
]

widget_defaults = dict(
    font='sans',
    fontsize=12,
    padding=3,
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
