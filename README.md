# zsh configuration

## Installation

```sh
git clone https://github.com/larsch/zshrc ~/.config/zsh && \
echo 'export ZDOTDIR=~/.config/zsh; source ${ZDOTDIR}/.zshenv' >~/.zshenv
```

## Dependencies for full functionality

```sh
zinstall
```

or

```sh
sudo pacman -Syu --needed fd fzf ripgrep exa grml-zsh-config zsh-syntax-highlighting
```

## Updating

```sh
zupdate
```
