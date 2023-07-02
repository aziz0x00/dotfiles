from libqtile.config import Group, Match, ScratchPad, DropDown


groups = [
    Group(name=str(i + 1), label=l)
    for i, l in enumerate(("  ", "  ", " 󰖟 ", "  ", "  "))
]

groups[1].matches = [Match(wm_class="vscodium"), Match(wm_class="wireshark")]  # code group
groups[2].matches = [Match(wm_class="qutebrowser")]  # web group
