# ============================================================================
#
# Hook configuration for zoxide.
#

# Initialize hook to add new entries to the database.
if (not ($env | default false __zoxide_hooked | get __zoxide_hooked)) {
  let-env __zoxide_hooked = true
  let-env config = ($env | default {} config).config
  let-env config = ($env.config | default {} hooks)
  let-env config = ($env.config | update hooks ($env.config.hooks | default [] pre_prompt))
  let-env config = ($env.config | update hooks.pre_prompt ($env.config.hooks.pre_prompt | append { || zoxide add -- $env.PWD }))
}

# ============================================================================
#
# When using zoxide with --no-cmd, alias these internal functions as desired.
#

# Jump to a directory using only keywords.
def-env __zoxide_z [...rest:string] {
  # `z -` does not work yet, see https://github.com/nushell/nushell/issues/4769
  let arg0 = ($rest | append '~').0
  let path = if (($rest | length) <= 1) and ($arg0 == '-' or ($arg0 | path expand | path type) == dir) {
    $arg0
  } else {
    (zoxide query --exclude $env.PWD -- $rest | str trim -r -c "\n")
  }
  cd $path
}

# Jump to a directory using interactive search.
def-env __zoxide_zi  [...rest:string] {
  cd $'(zoxide query -i -- $rest | str trim -r -c "\n")'
}

# ============================================================================
#
# Commands for zoxide. Disable these using --no-cmd.
#

alias z = __zoxide_z
alias zi = __zoxide_zi
