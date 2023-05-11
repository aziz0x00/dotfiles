from libqtile import layout
from libqtile.config import Match

from .colors import *


dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = False
bring_front_click = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="sxiv"),
        Match(wm_class="Zathura"),
    ],
    border_focus=color[2],
    border_normal=color[8],
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
