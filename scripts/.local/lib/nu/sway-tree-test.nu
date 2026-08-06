#!/usr/bin/env nu

# Run with: nu sway-tree-test.nu

use std assert
use sway-tree.nu *

def leaf [id: string] {
    { app_id: $id, nodes: [], floating_nodes: [] }
}

def test-matches-app-id [] {
    assert (find-window (leaf "thorium-browser") "thorium")
}

def test-is-case-insensitive [] {
    assert (find-window (leaf "Telegram") "telegram")
}

def test-rejects-a-miss [] {
    assert (not (find-window (leaf "kitty") "thorium"))
}

def test-finds-a-nested-child [] {
    let tree = { nodes: [{ nodes: [(leaf "zapzap")] }] }
    assert (find-window $tree "zapzap")
}

def test-finds-a-floating-window [] {
    let tree = { nodes: [], floating_nodes: [(leaf "pavucontrol")] }
    assert (find-window $tree "pavucontrol")
}

# xwayland windows carry a class instead of an app_id
def test-matches-xwayland-class [] {
    let node = { window_properties: { class: "Steam" }, nodes: [] }
    assert (find-window $node "steam")
}

def test-survives-a-node-with-neither [] {
    assert (not (find-window { nodes: [] } "anything"))
}

def main [] {
    test-matches-app-id
    test-is-case-insensitive
    test-rejects-a-miss
    test-finds-a-nested-child
    test-finds-a-floating-window
    test-matches-xwayland-class
    test-survives-a-node-with-neither

    print "sway-tree: 7 passed"
}
