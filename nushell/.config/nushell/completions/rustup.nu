# autocompletions for rust

# def "nu-complete rustup" [] {
#   rustup --help
#   | lines
#   | str replace '    (.*)   (.*)' '$1'
#   | str join ' '
#   | str replace '(.*)SUBCOMMANDS:' ''
#   | str replace 'DISCUSSION(.*)' ''
#   | str replace '(\s+)' ' ' -a
#   | str trim
#   | split row ' '
# }
#
# export extern "rustup" [
#   command?: string@"nu-complete rustup"
# ]

def "nu-complete rustup update" [] {
  rustup toolchain list
  | lines
  | str replace '(.*)x(.*)-(.*)-(.*)' '$1'
  | str replace '-' ''
}

export extern "rustup update" [
  command?: string@"nu-complete rustup update"
  --help(-h)
  --force
  --force-non-host
  --no-self-update
]
