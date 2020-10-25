# Fish Shell

## Requirements

- fzf

```sh
yay -S fzf
```

## Install

```sh
yay -S fish fisher
chsh -s /usr/bin/fish
```

## Plugins

```sh
fisher add mattgreen/lucid.fish
fisher add jethrokuan/fzf
fisher add jorgebucaran/nvm.fish
```

- **nvm:** The nvm plugin will install its own nvm installation. After that we
  need to set the default node version: `nvm use x.x.x`

## Improvements

### Move our POSIX compliant shell to dash

Following the [arch wiki for dash](https://wiki.archlinux.org/index.php/Dash)
we can find useful to change the common shell to **dash** for security and
speed improvements:

```sh
yay -S dash
ln -sfT dash /usr/bin/sh
```

Also [Luke Smith](https://lukesmith.xyz/) has a good video explaining about
this: [Bash is Bloated!](https://lbry.tv/@Luke:7/bash-is-bloated:8).

## Funny stuff

- cowsay
- lolcat
- cmatrix

```sh
yay -S cowsay lolcat cmatrix
```

- For the configuration files I use: `cowsay -f dragon 'text'`

## References

- https://fishshell.com/
- https://github.com/jorgebucaran/awesome.fish
- https://github.com/jorgebucaran/fisher
