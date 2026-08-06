# TODO

Pending work on this repo, kept across sessions.

## Scripts deliberately left out of the repo

These live in `~/.local/bin` and stay unversioned on purpose. Nothing in the
repo references them any more, so a fresh install is not affected.

- `jarvis*.nu`: an assistant experiment, superseded by current AI tooling.
  The sway binding is gone. Belongs in a future repo about AI integration,
  not in dotfiles.
- `manganorm.nu`, `openvpn3-reinstall.nu`, `to_webm.nu`: personal one-offs,
  not configuration.

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
