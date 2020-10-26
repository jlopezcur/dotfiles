# Vim 

Currently I'm using the git version (next 0.5) so the configuration only apply
to this version right now.

## Autocompletion

Using LSP needs some manual installation for several languages:

- tsserver:
  ```sh
  npm i -g typescript typescript-language-server
  ```
- texlab:
  ```sh
  yay -S texlive-core texlab
  ```

## References

- [tree-sitter tracking issue](https://github.com/neovim/neovim/issues/11724)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
