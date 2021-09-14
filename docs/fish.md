# Fish Shell

## Requirements

- fzf

```
paru fzf
```

## Install

```
paru fish fisher
chsh -s /usr/bin/fish
```

## Plugins

```
fisher add jethrokuan/fzf
fisher add jorgebucaran/nvm.fish
fisher add jethrokuan/z
```

- **nvm:** The nvm plugin will install its own nvm installation. After that we
  need to set the default node version: `nvm use x.x.x`

## Prompt

[Starship](https://starship.rs/)

```
paru starship
```

## Improvements

### Move our POSIX compliant shell to dash

Following the [arch wiki for dash](https://wiki.archlinux.org/index.php/Dash)
we can find useful to change the common shell to **dash** for security and
speed improvements:

```
paru dash
ln -sfT dash /usr/bin/sh
```

Also [Luke Smith](https://lukesmith.xyz/) has a good video explaining about
this: [Bash is Bloated!](https://lbry.tv/@Luke:7/bash-is-bloated:8).

## Utilities

- [cheat](https://github.com/cheat/cheat)

## Funny stuff

- cowsay
- lolcat
- cmatrix

```
paru cowsay lolcat cmatrix
```

- For the configuration files I use: `cowsay -f dragon 'text'`

## References

- https://fishshell.com/
- https://github.com/jorgebucaran/awesome.fish
- https://github.com/jorgebucaran/fisher
