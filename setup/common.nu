# Shared helpers for the setup scripts.

export const REPO_DIR = (path self | path dirname | path dirname)

export def banner [emoji: string, title: string] {
    print $"\n($emoji)  ($title)"
}

export def install [packages: list<string>] {
    if ($packages | is-empty) { return }

    print $"   pacman: ($packages | length) packages"
    ^sudo pacman -S --needed --noconfirm ...$packages
}

export def install-aur [packages: list<string>] {
    if ($packages | is-empty) { return }

    if (which paru | is-empty) {
        print "   paru not found, skipping AUR packages"
        return
    }

    print $"   paru: ($packages | length) packages"
    ^paru -S --needed --noconfirm ...$packages
}

export def link [packages: list<string>] {
    if ($packages | is-empty) { return }

    print $"   stow: ($packages | str join ', ')"
    $packages | each { |pkg|
        ^stow -t $nu.home-dir -d $REPO_DIR $pkg
    } | ignore
}
