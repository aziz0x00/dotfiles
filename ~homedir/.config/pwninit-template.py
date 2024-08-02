#!/usr/bin/env python3

from pwn import *

{bindings}

context.binary = {bin_name}

libc = {bin_name}.libc
libc.address = {bin_name}.libs[e.libc.path]

context.terminal = ["tmux", "neww", "-n", "pwn-gdb"]

io: tube


def conn(connect_remote=False, level="info"):

    if args.REMOTE or connect_remote:
        io = remote("addr", 1337)
    else:
        io = process({proc_args}, level=level)  # set to "error" to suppress
        if args.DEBUG:
            gdb.attach(io)

    return io


def main():
    global io
    io = conn()

    # good luck pwning :)

    io.interactive()


if __name__ == "__main__":
    main()
