# TODO

Pending work on this repo, kept across sessions.

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
- [ ] Delete or port whatever is worth keeping. They call wofi and alacritty,
      neither of which is installed any more, so they are already broken.

## Related repos

- [ ] Review and delete `dotfiles-private`. Careful: `~/.config/himalaya` is
      a live symlink into it.
- [ ] `dotfiles-server`: add it as `setup/server.nu` here rather than a
      separate repo, at least until the server config actually diverges.

## Housekeeping

- [ ] Push to Codeberg
- [ ] `archinfo.nu` is a toy, revisit when there is time
- [ ] Keep checking GTK rendering across apps as they come up
