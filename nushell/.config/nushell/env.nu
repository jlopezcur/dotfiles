# Nushell Environment Config File

$env.PROMPT_INDICATOR_VI_INSERT = ""
$env.PROMPT_INDICATOR_VI_NORMAL = "N "
$env.PROMPT_MULTILINE_INDICATOR = "::: "

# Volta
$env.VOLTA_HOME = $"($env.HOME)/.volta"

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
$env.PATH = ($env.PATH | split row (char esep) | prepend [
  $"($env.HOME)/.local/bin/",
  $"($env.HOME)/.cargo/bin",
  $"($env.VOLTA_HOME)/bin"
])

$env.EDITOR = "nvim"
$env.VISUAL = "nvim"
$env.VISUAL = "nvim"
$env.BROWSER = "thorium-browser"
# $env.XDG_CURRENT_DESKTOP = "sway"

$env.LANG = "en_US.utf8"
$env.ANDROID_HOME = $"($env.HOME)/Android/Sdk"
$env.NDK_HOME = $"($env.ANDROID_HOME)/ndk/28.0.12433566"

