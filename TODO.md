# TODO

Pending work on this repo, kept across sessions.

## More scripts living outside the repo

`~/.local/bin` holds 11 unversioned scripts. Five are called from the repo,
so a fresh install leaves them broken:

- `jarvis.nu`, bound to `$mod+Alt+j` in the sway config
- `maintenance-{disk,info,monitor,security}-launcher.nu`, the four submenus
  `maintenance-launcher.nu` opens

The rest are standalone: `jarvis-chat.nu`, `jarvis-dj.nu`, `jarvis-mtv.nu`,
`manganorm.nu`, `openvpn3-reinstall.nu`, `to_webm.nu`.

- [ ] Decide which ones belong in the repo. Check the jarvis ones for API
      keys before committing anything.
- [ ] `openvpn3-reinstall.nu` looks obsolete now that ProtonVPN replaced
      openvpn3

## Launchers for tools no longer in use

`$mod+Shift+v` still runs `vpn-launcher.nu`, and waybar has a `custom/vpn`
module calling `vpn-check`, but openvpn3 is gone. `otp-launcher.nu` and
`passwd-launcher.nu` are still present with their bindings commented out,
and gopass has been replaced by ProtonPass.

- [ ] Decide whether the vpn module and launcher still do anything useful
- [ ] Retire `otp-launcher.nu` and `passwd-launcher.nu` if gopass is done

## Related repos

- [ ] Review and delete `dotfiles-private`. Careful: `~/.config/himalaya` is
      a live symlink into it.
- [ ] `dotfiles-server`: add it as `setup/server.nu` here rather than a
      separate repo, at least until the server config actually diverges.

## Housekeeping

- [ ] Push to Codeberg
- [ ] `archinfo.nu` is a toy, revisit when there is time
- [ ] Keep checking GTK rendering across apps as they come up
