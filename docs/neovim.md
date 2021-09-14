# Vim 

Currently I'm using the git version (next 0.5) so the configuration only apply
to this version right now.

## Requirements

- xsel
- neovim node package

```sh
paru xsel
npm i -g neovim
pip install pynvim
```

## Install

```sh
git clone git@github.com:neovim/neovim.git
cd neovim
rm -rf build/
make CMAKE_BUILD_TYPE=Release
sudo make install
```

## Autocompletion

Using LSP needs some manual installation for several languages:

- tsserver: `npm i -g typescript typescript-language-server prettier eslint_d`
- texlab: `paru texlive-core texlab`
- rust: `rustup component add rls rust-analysis rust-src` https://github.com/rust-lang/rls
- python: `pip install python-language-server`
- vimls: `npm i -g vim-language-server`
- jsonls: `npm i -g vscode-json-languageserver`
- html: `npm i -g vscode-html-languageserver-bin`
- yaml: `npm i -g yaml-language-server`
- bashls: `npm i -g bash-language-server`
- cssls: `npm i -g vscode-css-languageserver-bin`
- summeko_lua: `npm i -g vscode-css-languageserver-bin`

## References

- [lucax88x/configs](https://github.com/lucax88x/configs/tree/master/dotfiles/.config/nvim)
- [Mastering the Vim Language, thoughtbot](https://www.youtube.com/watch?v=wlR5gYd6um0)
- [tree-sitter tracking issue](https://github.com/neovim/neovim/issues/11724)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- https://github.com/ecosse3/nvim
