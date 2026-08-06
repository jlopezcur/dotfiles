#!/usr/bin/env nu

# Work layout: browser on workspace 2, messaging on workspace 3.
#
# Picked up automatically by sway-workspaces.nu, which lists every
# sway-setup-*.nu next to it.

use ../lib/nu/sway-tree.nu *

def main [] {
    print "Setting up work..."

    ^swaymsg workspace 2
    print "Launching Thorium..."
    ^setsid -f thorium-browser

    if (wait-for-window "thorium") {
        print "Thorium ready"
    } else {
        print "Timed out waiting for Thorium"
    }

    ^swaymsg workspace 3
    print "Launching messaging apps..."
    ^setsid -f zapzap
    ^setsid -f Telegram
    ^setsid -f fluffychat

    print "Done"
}
