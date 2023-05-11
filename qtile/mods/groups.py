from libqtile.config import Group, Match, ScratchPad, DropDown


groups = [
    Group(name=str(i + 1), label=l)
    for i, l in enumerate(("general", "code", "web", "pwn", "etc"))
]

groups[1].matches = [Match(wm_class="vscodium")]  # code group
groups[2].matches = [Match(wm_class="qutebrowser")]  # web group
