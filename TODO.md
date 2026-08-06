# TODO

Pending work on this repo, kept across sessions.

## Launcher: finish the wofi to fuzzel migration

Migrated. wofi config is in `legacy/`, the package is still installed on
purpose so there is a working fallback for a few days.

- [ ] Check every binding actually works, in particular the two width
      conversions, which are approximations: wofi counted pixels, fuzzel
      counts characters
  - `clipboard-launcher.nu`: `--width 800` became `-w 100`
  - `bookmarks-launcher.nu`: `--width 80%` became `-w 80`
- [ ] Once confirmed, `sudo pacman -Rns wofi`

## Scripts living outside the repo

`~/scripts/` holds two live scripts that are not versioned anywhere, and
`launchers.conf` binds one of them.

- [ ] Move `wofi-workspaces.nu` and `sway-setup-work.nu` into the repo, or
      decide they stay out on purpose
- [ ] `wofi-workspaces.nu` was migrated to fuzzel in place, so the name no
      longer matches what it does

## Sway script cleanup

`sway/.config/sway/scripts/` holds six orphans. Only `mount.sh` is still
referenced from the config; the rest were superseded by the `-launcher.nu`
scripts and still call alacritty.

- [ ] Review one by one: `capture.sh`, `maintenance.sh`, `otp.sh`,
      `password.sh`, `system.sh`, `vpn.sh`
- [ ] Delete or port whatever is worth keeping. They still call wofi and
      alacritty, both of which are on the way out, so leaving them is a trap.

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
