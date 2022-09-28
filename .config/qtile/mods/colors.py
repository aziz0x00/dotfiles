from os import getenv

color = [] # 0:bg, 7:fg
with open(getenv('HOME')+'/.cache/wal/colors') as f:
    for c in f.read().splitlines():
        color.append(c)

__all__ = ['color']
