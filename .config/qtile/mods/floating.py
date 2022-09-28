import re

from libqtile        import layout
from libqtile.config import Match

from .colors import *


dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = False
bring_front_click = True
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='copyq'),
    Match(wm_class='qstardict'),  # gitk
    Match(wm_class='sxiv'),  # gitk
    Match(wm_class='Zathura'),  # gitk
    Match(wm_class='Alacritty', title=re.compile(r'^CopyQ')),
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
], border_focus=color[2], border_normal=color[8])
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
