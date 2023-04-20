# autocompletions for zathura

module completions {

  # zathura
  # ----------------------------------------------------------------------------

  def "nu-complete zathura" [] {
    ls | filter {|x| $x.name | str ends-with '.pdf'} | get name
  }

  export extern "zathura" [
    command: string@"nu-complete zathura"     # name of the command to run
  ]

}

use completions *
