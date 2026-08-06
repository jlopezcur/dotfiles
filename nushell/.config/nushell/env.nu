# Nushell Environment Config File

$env.PROMPT_INDICATOR_VI_INSERT = ""
$env.PROMPT_INDICATOR_VI_NORMAL = "N "
$env.PROMPT_MULTILINE_INDICATOR = "::: "

# Volta
$env.VOLTA_HOME = $"($env.HOME)/.volta"

# pnpm
$env.PNPM_HOME = $"($env.HOME)/.local/share/pnpm"

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
$env.PATH = ($env.PATH | split row (char esep) | prepend [
  $"($env.HOME)/.local/bin/",
  $"($env.HOME)/.cargo/bin",
  $"($env.VOLTA_HOME)/bin",
  $"($env.HOME)/go/bin",
  $"($env.PNPM_HOME)",
  "/var/lib/snapd/snap/bin"
])

$env.EDITOR = "nvim"
$env.VISUAL = "nvim"
$env.VISUAL = "nvim"
$env.BROWSER = "thorium-browser"

$env.LANG = "en_US.utf8"
$env.ANDROID_HOME = $"($env.HOME)/Android/Sdk"
$env.NDK_HOME = $"($env.ANDROID_HOME)/ndk/28.0.12433566"
$env.TERM = "kitty"

$env.SOPS_AGE_KEY_FILE = $"($env.HOME)/.config/sops/age/keys.txt"
$env.KUBECONFIG = $"($env.HOME)/.kube/config"
$env.TALOSCONFIG = $"($env.HOME)/.talos/config"
