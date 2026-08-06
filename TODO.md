# TODO

Pending work on this repo, kept across sessions.

## Launcher: decide between wofi and fuzzel

Both installed, both from `extra`. 24 of the 26 call sites already use plain
dmenu mode, so the migration is mostly mechanical.

- [ ] Decide whether fuzzel replaces wofi
- [ ] If it does, migrate the call sites:
  - `wofi -i --show dmenu -p "X"` becomes `fuzzel --dmenu -p "X"` (`-i` is the
    default in fuzzel)
  - `wofi -i --show drun` becomes `fuzzel`
  - `pgrep -x wofi` guards become `pgrep -x fuzzel`
  - `--width 800` has no direct equivalent: fuzzel's `-w` counts characters,
    not pixels
- [ ] Commit `fuzzel/.config/fuzzel/fuzzel.ini`, still uncommitted while the
      decision is open
- [ ] Drop the loser from `setup/desktop.nu` and move its config to `legacy/`

## Sway script cleanup

`sway/.config/sway/scripts/` holds six orphans. Only `mount.sh` is still
referenced from the config; the rest were superseded by the `-launcher.nu`
scripts and still call alacritty.

- [ ] Review one by one: `capture.sh`, `maintenance.sh`, `otp.sh`,
      `password.sh`, `system.sh`, `vpn.sh`
- [ ] Delete or port whatever is worth keeping

## Session and environment

- [ ] `fn.conf` still runs `systemctl --user import-environment` with no
      arguments. `uwsm finalize` already does this, more selectively.
- [ ] Remove the orphaned `elephant-*` packages (6 of them). They were
      walker's backend and walker is no longer installed.

## Related repos

- [ ] Review and delete `dotfiles-private`. Careful: `~/.config/himalaya` is
      a live symlink into it.
- [ ] `dotfiles-server`: add it as `setup/server.nu` here rather than a
      separate repo, at least until the server config actually diverges.

## Housekeeping

- [ ] Push to Codeberg
- [ ] `archinfo.nu` is a toy, revisit when there is time
- [ ] Keep checking GTK rendering across apps as they come up
