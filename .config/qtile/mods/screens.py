import datetime

from libqtile import bar, widget
from libqtile.config import Screen

from .colors import *


t = datetime.datetime.today()
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
                widget.Countdown(format='{H}:{M}:{S}', date=datetime.datetime(
                    t.year, t.month, t.day, 23, 00)),
#                widget.Sep(foreground=color[4]+'cc', size_percent=100),
#                widget.Pomodoro(color_inactive=color[7]+'90'),
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
del t
