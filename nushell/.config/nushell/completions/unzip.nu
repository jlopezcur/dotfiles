# autocompletions for unzip

def "nu-complete unzip" [] {
  ls
  | filter {|x| ($x.name | split row "." | last) in ['zip']}
  | each {|x| $"`($x.name)`"}
}

export extern "unzip" [
  command: string@"nu-complete unzip"     # name of the command to run
]
