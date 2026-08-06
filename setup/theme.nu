#!/usr/bin/env nu

# GTK theming.
#
# adw-gtk3-dark is used instead of a third-party theme on purpose: GTK4 apps
# built on libadwaita ignore GTK_THEME and do not load themes from
# /usr/share/themes at all, so the only way to get a consistent look across
# GTK3 and GTK4 is to make GTK3 match libadwaita.

use common.nu *

const PACKAGES = ["adw-gtk-theme" "adwaita-icon-theme" "ttf-opensans"]

# Flatpak apps cannot see /usr/share/themes, they need the theme as a runtime.
const FLATPAK_THEME = "org.gtk.Gtk3theme.adw-gtk3-dark"

const STOW = ["gtk" "environment"]

# Flatpak apps and libadwaita read these over the portal; native apps read the
# stowed settings.ini files. Both have to agree or windows render
# inconsistently.
const GTK_SETTINGS = {
    "gtk-theme": "adw-gtk3-dark"
    "icon-theme": "Adwaita"
    "font-name": "Open Sans 11"
    "cursor-theme": "Adwaita"
    "cursor-size": "24"
    "color-scheme": "prefer-dark"
}

def install-flatpak-theme [] {
    if (which flatpak | is-empty) {
        print "   flatpak not installed, skipping theme runtime"
        return
    }

    print $"   flatpak: ($FLATPAK_THEME)"
    ^flatpak install -y --noninteractive flathub $FLATPAK_THEME
}

def apply-gtk-settings [] {
    print "   dconf: org.gnome.desktop.interface"
    $GTK_SETTINGS | transpose key value | each { |setting|
        ^gsettings set org.gnome.desktop.interface $setting.key $setting.value
    } | ignore
}

def main [] {
    banner "🎨" "Theme"
    install $PACKAGES
    install-flatpak-theme
    link $STOW
    apply-gtk-settings
}
