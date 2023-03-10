# Nostalgia

A 32x32 cursor for X11 with retro shape and its own touch of creativity.
Inspired by the old cursors from MacOS, Windows Xp and default X11 cursor.

## Dependencies
  + [`becho`](https://github.com/skippyr/becho)
  + `xcursorgen`
  + `imagemagick`
  + `make`

## Installation

Right now, this cursor is being developed, but some cursors have already been
created and you can test them. To do it, simply use the following command:

```bash
sudo make build install
```

To uninstall it, use this other command:

```bash
sudo make uninstall
```

If you want, you can change the colors of the cursor by modifying the values
that are in the `Makefile` in the `Characteristics` section. Those values must
be HEX colors. The default colors are from the [`Tropical Paradise Dark`](https://github.com/skippyr/tropical_paradise)
color scheme.

## Copyright

Copyright (c) 2023, Sherman Rofeman. MIT License.
