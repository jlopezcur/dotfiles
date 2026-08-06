#!/usr/bin/env nu

# Workspace setup launcher. Lists every sway-setup-*.nu next to this script
# and runs the one picked from the menu.
#
# Bound in sway with:
#   bindsym $mod+Shift+w exec ~/.local/bin/sway-workspaces.nu

const SCRIPT_DIR = (path self | path dirname)

const NOTIFY_TITLE = "sway-workspaces"

# "sway-setup-work.nu" -> "work"
def setup-label [path: string]: nothing -> string {
    $path
    | path basename
    | str replace "sway-setup-" ""
    | str replace ".nu" ""
}

def main [] {
    let setups = (
        glob ($SCRIPT_DIR | path join "sway-setup-*.nu")
        | sort
        | each {|path| { label: (setup-label $path), path: $path } }
    )

    if ($setups | is-empty) {
        ^notify-send $NOTIFY_TITLE "No sway-setup-*.nu scripts found"
        return
    }

    let choice = (
        $setups
        | get label
        | str join "\n"
        | ^fuzzel --dmenu --prompt "Workspace "
        | str trim
    )

    if ($choice | is-empty) {
        return
    }

    let selected = ($setups | where label == $choice)

    if ($selected | is-empty) {
        ^notify-send $NOTIFY_TITLE $"Not a valid choice: ($choice)"
        return
    }

    # Detached so the menu does not block sway while the setup runs
    ^setsid -f nu ($selected | first | get path)
    ^notify-send $NOTIFY_TITLE $"Launching workspace: ($choice)"
}
