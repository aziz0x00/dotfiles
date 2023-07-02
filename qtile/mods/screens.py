import datetime

from libqtile import bar, widget
from libqtile.config import Screen

from .colors import *


t = datetime.datetime.today()
screens = [
    Screen(
        top=bar.Bar(
            [
                # widget.CurrentLayoutIcon(scale=0.7, background=color[0] + "fa", foreground=color[3]),
                widget.GroupBox(
                    highlight_method="line",
                    disable_drag=True,
                    highlight_color=[color[4] + "20"] * 2,
                    this_current_screen_border=color[4] + "80",
                    active=color[15],
                    inactive=color[15] + "60",
                    margin_x=0,
                    use_mouse_wheel=False,
                ),
                widget.Sep(
                    foreground=color[4] + "00",
                    linewidth=1,
                    padding=10,
                    size_percent=100,
                ),
                widget.WindowName(
                    foreground=color[6],
                    # foreground="#ffffff",
                    # background=color[4] + "fa",
                    fontsize=16,
                    padding=6,
                ),
                widget.Wlan(
                    interface="wlp1s0", disconnected_message="", foreground=color[7]
                ),
                widget.Net(foreground=color[7] + "90"),
                widget.NetGraph(
                    border_width=0,
                    line_width=1,
                    graph_color=color[4] + "cc",
                    fill_color=color[4] + "70",
                ),
                widget.Sep(foreground=color[4] + "44", size_percent=100),
                widget.Countdown(
                    format="{H}:{M}:{S}",
                    date=datetime.datetime(t.year, t.month, t.day, 23, 00),
                ),
                widget.Sep(foreground=color[4] + "44", size_percent=100),
                widget.Battery(format=" {percent:2.0%}"),
                widget.Sep(foreground=color[4] + "44", size_percent=100),
                widget.Clock(format=" %a, %b %d - %R "),
            ],
            35,
            background=color[0] + "fa",
        ),
    ),
]
del t
