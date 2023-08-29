# autocompletions for npm

def "nu-complete npm" [] {
  ^npm help
  | lines
  | str join ' '
  | str replace '(.*)All commands:' ''
  | str replace 'Specify configs(.*)' ''
  | str replace -a ' ' ''
  | split row ','
}

export extern "npm" [
  command?: string@"nu-complete npm"
]

def "nu-complete npm run" [] {
  open ./package.json
  | get scripts
  | columns
}

export extern "npm run" [
  command?: string@"nu-complete npm run"
  --workspace(-w)
  --include-workspace-root
  --if-present
  --ignore-scripts
  --script-shell
]
