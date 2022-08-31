# NVIM configs
Largely based on (https://github.com/ChristianChiarulli/nvim)

Need to install packer (https://github.com/wbthomason/packer.nvim)

Run `:PackerSync` to install packages via Packer.


## Fonts
(From ChristianChiarulli)
- [A nerd font](https://github.com/ryanoasis/nerd-fonts)

- [codicon](https://github.com/microsoft/vscode-codicons/raw/main/dist/codicon.ttf)
- [An emoji font](https://github.com/googlefonts/noto-emoji/blob/main/fonts/NotoColorEmoji.ttf)
After moving fonts to `~/.local/share/fonts/`

Run: `$ fc-cache -f -v`

Coc \& Telescope require ripgrep to do "search".

In order to use these nvim plugins in a large codebase (e.g. Google), we should make sure to localize our search to only the current working directory.
- disable vim-rooter
- add `"coc.preferences.rootPatterns":[]` to CocConfig to overwrite the default behavior of coc, which searches for .git for instance to set the root directory.

Also, we have to do `set notermguicolors` to vim config when using `mosh` (much faster version of `ssh`) since mosh doesn't support true-color.

Need to install `ctags` as well
