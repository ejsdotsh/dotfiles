## sway configuration

- ~~set terminal~~
- ~~set font~~
- ~~setup input devices~~
- setup output devices
- update keybindings
- login manager

### login manager

```txt
[terminal]
# The VT to run the greeter on. Can be "next", "current" or a number
# designating the VT.
vt = 1

# The default session, also known as the greeter.
[default_session]

# `agreety` is the bundled agetty/login-lookalike. You can replace `$SHELL`
# with whatever you want started, such as `sway`.
command = "/usr/sbin/agreety --cmd sway --unsupported-gpu"
# if using wlgreet
#command = "sway --config /etc/greetd/sway-config"

# The user to run the command as. The privileges this user must have depends
# on the greeter. A graphical greeter may for example require the user to be
# in the `video` group.
user = "_greetd"

[initial_session]
command = "/usr/local/bin/sway-run"
user = "ejs"
```

## references

- [sway wiki](https://github.com/swaywm/sway/wiki)
- [greetd](https://man.sr.ht/~kennylevinsen/greetd/)
- [swayr](https://sr.ht/~tsdh/swayr/)

