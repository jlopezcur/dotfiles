# autocompletions for zathura

def "nu-complete zathura" [] {
  ls
  | filter {|x| ($x.name | split row "." | last) in ['pdf', 'epub', 'cbz', 'cbr']}
  | get name
}

export extern "zathura" [
  command: string@"nu-complete zathura"     # name of the command to run
]
