# Nushell Config File

# The default config record. This is where much of your global configuration is setup.
$env.config = {
  rm: {
    always_trash: false
  }
  history: {
    max_size: 10000 # Session has to be reloaded for this to take effect
    sync_on_enter: false # Enable to share history between multiple sessions, else you have to close the session to write history to file
    file_format: "plaintext" # "sqlite" or "plaintext"
  }
  edit_mode: vi # emacs, vi
  show_banner: false
}

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
zoxide init nushell | save -f ($nu.data-dir | path join "vendor/autoload/zoxide.nu")
carapace _carapace nushell | save -f ($nu.data-dir | path join "vendor/autoload/carapace.nu")

alias myip = curl http://ipecho.net/plain
alias l = exa -alh --icons --git
alias cat = bat
alias ping = gping
alias v = nvim
alias h = helix
alias vi = nvim
alias vim = nvim
alias du = dust
alias ip = ^ip -color=auto a

alias ga = git add
alias gc = git commit -v
alias gd = git diff
alias gst = git status
alias gco = git checkout
alias gcm = git checkout master
alias gcd = git checkout develop
alias gb = git branch
alias gbr = git branch --remote
alias gup = git pull
alias gp = git push

