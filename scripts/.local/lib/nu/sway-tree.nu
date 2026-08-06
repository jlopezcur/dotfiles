# Querying the sway window tree, shared by the sway-setup-* scripts.

# True when the node or any of its descendants matches the pattern, against
# either the wayland app_id or the xwayland class.
export def find-window [node: record, pattern: string]: nothing -> bool {
    if (node-matches $node $pattern) {
        return true
    }

    for child in (child-nodes $node) {
        if (find-window $child $pattern) {
            return true
        }
    }

    false
}

def node-matches [node: record, pattern: string]: nothing -> bool {
    let app_id = ($node.app_id? | default "")
    let class = ($node.window_properties?.class? | default "")

    (
        ($app_id | str contains --ignore-case $pattern) or
        ($class | str contains --ignore-case $pattern)
    )
}

def child-nodes [node: record]: nothing -> list {
    ($node.nodes? | default []) ++ ($node.floating_nodes? | default [])
}

# Polls the tree until a matching window appears. Returns whether it did;
# reporting is left to the caller.
export def wait-for-window [
    pattern: string
    timeout: duration = 30sec
]: nothing -> bool {
    let deadline = ((date now) + $timeout)

    while (date now) < $deadline {
        if (find-window (^swaymsg -t get_tree | from json) $pattern) {
            return true
        }

        sleep 500ms
    }

    false
}
