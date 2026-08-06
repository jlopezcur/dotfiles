$env.config = {
  rm: {
    always_trash: false
  }
  history: {
    max_size: 1_000_000
    sync_on_enter: true
    file_format: sqlite
    isolation: true
  }
  edit_mode: vi
  show_banner: false
}

let vendor_path: path = ($nu.data-dir | path join "vendor/autoload")

mkdir $vendor_path
starship init nu | save -f ($vendor_path | path join starship.nu)
carapace _carapace nushell | save -f ($vendor_path | path join carapace.nu)
# TODO: Uncomment next line when new version support last nushell
# zoxide init nushell | save -f ($vendor_path | path join zoxide.nu)

alias myip = curl http://ipecho.net/plain
alias l = exa -alh --icons --git
alias cat = bat
alias ping = gping
alias v = nvim
alias h = helix
alias p = paru
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

