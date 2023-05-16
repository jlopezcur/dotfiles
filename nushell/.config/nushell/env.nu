# Nushell Environment Config File

let-env PROMPT_INDICATOR_VI_INSERT = { || "" }
let-env PROMPT_INDICATOR_VI_NORMAL = { || "N " }
let-env PROMPT_MULTILINE_INDICATOR = { || "::: " }

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
let-env ENV_CONVERSIONS = {
  "PATH": {
    from_string: { |s| $s | split row (char esep) }
    to_string: { |v| $v | path expand | str join (char esep) }
  }
  "Path": {
    from_string: { |s| $s | split row (char esep) }
    to_string: { |v| $v | path expand | str join (char esep) }
  }
}

# Directories to search for scripts when calling source or use
#
# By default, <nushell-config-dir>/scripts is added
let-env NU_LIB_DIRS = [
    ($nu.config-path | path dirname | path join 'scripts')
]

# Directories to search for plugin binaries when calling register
#
# By default, <nushell-config-dir>/plugins is added
let-env NU_PLUGIN_DIRS = [
    ($nu.config-path | path dirname | path join 'plugins')
]

# Volta
let-env VOLTA_HOME = $"($env.HOME)/.volta"

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
let-env PATH = ($env.PATH | split row (char esep) | prepend [
  $"($env.HOME)/.local/bin/",
  $"($env.HOME)/.cargo/bin",
  $"($env.VOLTA_HOME)/bin"
])

let-env EDITOR = "nvim"
let-env VISUAL = "nvim"
let-env VISUAL = "nvim"
let-env BROWSER = "thorium-browser"

let-env LANG = "en_US.utf8"

