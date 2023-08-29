# autocompletions for paru

export extern "paru" [
  --help(-h)
  --version(-V)
  --database(-D)
  --files(-F)
  --query(-Q)
  --remove(-R)
  --sync(-S)
  --deptest(-T)
  --upgrade(-U)
]

def "nu-complete paru -R" [] {
  ^paru -Qe
  | lines
  | str replace ' (.*)' ''
}

export extern "paru -R" [
  --nosave(-n)
  --recursive(-s)
  command?: string@"nu-complete npm run"
]

