# dotfiles (alpha)

## Pieces

- Font: [FiraCode Nerd Font](https://github.com/tonsky/FiraCode)
- Emoji Font: [Noto Fonts Emoji](https://archlinux.org/packages/extra/any/noto-fonts-emoji/)
- Icons: [Adwaita](https://archlinux.org/packages/extra/any/adwaita-icon-theme/)
- GTK Theme: [adw-gtk3](https://github.com/lassekongo83/adw-gtk3) (`adw-gtk3-dark`)
  - Applied by `setup/theme.nu`, see [Theming](#theming)
- GTK Theme Manager: [lxappearance](https://wiki.lxde.org/es/LXAppearance)
- Editor:
  - [neovim](https://neovim.io/) [:pencil: Notes](https://github.com/jlopezcur/dotfiles-nvim)
  - [helix](https://helix-editor.com/)
- File Manager: [yazi](https://github.com/sxyazi/yazi)
- (tiling)WM: [sway](https://swaywm.org/) [:pencil: Notes](docs/sway.md)
- Shell: [nushell](https://www.nushell.sh/)
- Prompt: [starship](https://starship.rs/)
- Terminal Emulator: [kitty](https://github.com/kovidgoyal/kitty)
- Launcher: [fuzzel](https://codeberg.org/dnkl/fuzzel)
- Grep: [RigGrep](https://github.com/BurntSushi/ripgrep)
- Fzf: [Fzf](https://github.com/junegunn/fzf)
- Browsers:
  - [qutebrowser](https://qutebrowser.org/)
  - [Nyxt](https://github.com/atlas-engineer/nyxt)
  - [Brave](https://brave.com/) [:pencil: Notes](docs/brave.md)
  - [LibreWolf](https://gitlab.com/librewolf-community)
- PDF: [Zathura](<https://en.wikipedia.org/wiki/Zathura_(document_viewer)>)
- Vector: [Inkscape](https://inkscape.org/es/)
- Raster: [Gimp](https://www.gimp.org/)
- Image Viewer: [imv](https://github.com/eXeC64/imv)
- Color Picker: [gpick](https://github.com/thezbyg/gpick)
- Task Manager: [bpytop](https://github.com/aristocratos/bpytop)
- Monitoring: [glances](https://github.com/nicolargo/glances)
- Music: [cmus](https://cmus.github.io/)
- 3D & Video Edition: [blender](https://www.blender.org/)
- IRC: [weechat](https://weechat.org/)
  - Server#1: [libera.chat](https://libera.chat/)
- Firewall: [ufw](https://launchpad.net/ufw)
- Video Recording: [OBS Studio](https://obsproject.com/)
- Locker: [swaylock-effects](https://github.com/mortie/swaylock-effects)
- Font Preview: [fontpreview](https://github.com/sdushantha/fontpreview)
- Package Manager: [paru](https://github.com/morganamilo/paru)
- Languages Info: [tokei](https://github.com/XAMPPRocky/tokei)
- Git browser:
  - [tig](https://github.com/jonas/tig)
  - [gitui](https://github.com/extrawurst/gitui)
- Cheatsheet: [navi](https://github.com/denisidoro/navi)
- Cryptocurrencies: [cointop](https://github.com/miguelmota/cointop)
- Kernel Manager: [kmon](https://github.com/orhun/kmon)
- Pulse Audio Mixer: [ncpamixer](https://github.com/fulhax/ncpamixer)
- Email:
  - Client: [neomutt](https://neomutt.org/)
  - CLI: [himalaya](https://github.com/soywod/himalaya)
- Password Manager: [gopass](https://www.gopass.pw/)
  - Mobile: [Password Store](https://play.google.com/store/apps/details?id=dev.msfjarvis.aps)
  - Browser: [Gopass Bridge](https://github.com/gopasspw/gopassbridge)
- Focus Sounds: [blanket](https://github.com/rafaelmardojai/blanket)
- Tmux:
  - [tmux](https://github.com/tmux/tmux)
  - [byobu](https://www.byobu.org/)
- Video Wallpapers: [mpvpaper](https://github.com/GhostNaN/mpvpaper)
- Tabular data viewer: [visidata](https://www.visidata.org/)
- Torrent: [rtorrent](https://github.com/rakshasa/rtorrent/wiki)
- Calendar:
  - [remind](https://dianne.skoll.ca/projects/remind/)
  - [calcurse](https://www.calcurse.org/)
  - [wyrd](https://gitlab.com/wyrd-calendar/wyrd)

## Install

```nu
nu setup.nu                  # everything
nu setup.nu desktop theme    # only those steps
nu setup/apps.nu             # a single step on its own
```

Every step installs its packages, then stows its configs. All of them are
idempotent, so re-running is safe.

| Step | | Covers |
| --- | --- | --- |
| `setup/desktop.nu` | 🖥️ | sway, waybar, mako, fuzzel and the Wayland tools |
| `setup/theme.nu` | 🎨 | GTK theming, see [Theming](#theming) |
| `setup/shell.nu` | 🐚 | nushell, starship, kitty, git and CLI tools |
| `setup/apps.nu` | 📦 | everyday applications |

Shared helpers live in `setup/common.nu`.

`workstyle` is installed with cargo rather than pacman, so no step installs
it. Its config is stowed by `setup/desktop.nu` all the same.

## Legacy

`legacy/` holds configs for things no longer in use, kept for reference. No
setup step touches it. To bring one back:

```nu
stow -vt ~ -d legacy i3
```

## Theming

Handled by `setup/theme.nu`: installs the theme packages, stows `gtk` and
`environment`, and writes the GTK settings to dconf.

GTK4 apps built on libadwaita ignore `GTK_THEME` and do not load themes from
`/usr/share/themes` at all, so no third-party theme can cover both GTK3 and
GTK4. `adw-gtk3-dark` solves it from the other side: it makes GTK3 apps look
like libadwaita, so everything matches.

The theme has to be declared in four places or windows render
inconsistently:

| Where | Read by |
| --- | --- |
| `environment/.config/environment.d/theme.conf` | GTK3 apps at session start |
| `gtk/.config/gtk-3.0/settings.ini` | GTK3 apps not going through the portal |
| `gtk/.config/gtk-4.0/settings.ini` | GTK4 apps not going through the portal |
| dconf | The portal, Flatpak apps, libadwaita |

Flatpak apps cannot see `/usr/share/themes`, so the theme is also installed
as a runtime (`org.gtk.Gtk3theme.adw-gtk3-dark`).

## Replacements

- Ls: [exa](https://the.exa.website/)
- Cat: [bat](https://github.com/sharkdp/bat)
- Grep: [ripgrep](https://github.com/BurntSushi/ripgrep)
- Ps: [procs](https://github.com/dalance/procs)
- Sudo: [doas](https://github.com/Duncaen/OpenDoas)

## AdBlock

- Hosts: [StevenBlack](https://github.com/StevenBlack/hosts)

## References

- https://github.com/gerardbm/dotfiles
- https://github.com/AaronFoley/dotfiles
- https://github.com/mathiasbynens/dotfiles
