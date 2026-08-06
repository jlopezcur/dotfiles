use ../pause

export def main [command: string, args: list<any>] {
  let arguments = ($args | str join " ")
  let code = $"($env.term) ($arguments)"
  do (nu -c $code)
  pause
}
