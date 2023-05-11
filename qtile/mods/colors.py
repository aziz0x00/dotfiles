from os import environ

color = [] # 0:bg, 7:fg
with open(environ['HOME'] + '/.cache/wal/colors') as f:
    for c in f.read().splitlines():
        color.append(c)

__all__ = ['color']
