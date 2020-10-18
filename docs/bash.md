# Bash

## Requirements

- fzf
- nvm
- bash-git-prompt

```sh
yay -S fzf nvm bash-git-prompt
```

## Improvements

### Move our POSIX compliant shell to dash

Following the arch wiki for dash [^1] we can find useful to change the common
shell to **dash** for security and speed improvements:

```sh
ln -sfT dash /usr/bin/sh
```

Also [Luke Smith](https://lukesmith.xyz/) has a good video explaining about this [^2].

## Funny stuff

- cowsay
- lolcat
- cmatrix

```sh
yay -S cowsay lolcat cmatrix
```

[^1]: [Arch Wiki: **dash**](https://wiki.archlinux.org/index.php/Dash)
[^2]: [Luke Smith: **Bash is Bloated!**](https://lbry.tv/@Luke:7/bash-is-bloated:8)
