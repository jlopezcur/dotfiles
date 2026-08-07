#!/usr/bin/env nu

# Entry point for setting up this machine.
#
#   nu setup.nu                  every step
#   nu setup.nu desktop theme    only those steps
#
# Each step is also runnable on its own: nu setup/desktop.nu

const REPO_DIR = (path self | path dirname)

const STEPS = ["desktop" "theme" "shell" "apps"]

def main [
    ...steps: string # steps to run, all of them when omitted
] {
    let selected = if ($steps | is-empty) { $STEPS } else { $steps }
    let unknown = ($selected | where { |step| $step not-in $STEPS })

    if ($unknown | is-not-empty) {
        print $"Unknown steps: ($unknown | str join ', ')"
        print $"Available: ($STEPS | str join ', ')"
        exit 1
    }

    $selected | each { |step|
        ^nu $"($REPO_DIR)/setup/($step).nu"
    } | ignore

    print "\n✅ Done."
}
