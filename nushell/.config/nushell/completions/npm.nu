# autocompletions for npm

module completions {

  # npm
  # ----------------------------------------------------------------------------

  def "nu-complete npm" [] {
    ^npm help | lines | str join ' ' | str replace '(.*)All commands:' '' | str replace 'Specify configs(.*)' '' | str replace -a ' ' '' | split row ','
  }

  export extern "npm" [
    command: string@"nu-complete npm"     # name of the command to run
  ]

  # npm run
  # ----------------------------------------------------------------------------

  def "nu-complete npm run" [] {
    ^npm run | lines | filter {|x| ($x | str starts-with '  ') and (not ($x | str starts-with '    '))} | each {|x| $x | str trim }
  }

  export extern "npm run" [
    command: string@"nu-complete npm run" # name of the script to run
  ]

}

use completions *
