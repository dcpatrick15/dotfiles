# Dotfiles

Config files for neovim, tmux, zsh, and vim.

## Prerequisites

Install these before running the install script:

- [Neovim](https://neovim.io/) (rocks.nvim for plugin management)
- [tmux](https://github.com/tmux/tmux) + [TPM](https://github.com/tmux-plugins/tpm)
- [lazygit](https://github.com/jesseduber/lazygit)
- [lazydocker](https://github.com/jesseduber/lazydocker)
- [oh-my-zsh](https://ohmyz.sh/)

### macOS (Homebrew)

```sh
brew install neovim tmux lazygit lazydocker zsh
```

### Arch/Manjaro

```sh
sudo pacman -S neovim tmux lazygit zsh
# lazydocker from AUR
yay -S lazydocker
```

## Install

```sh
git clone https://github.com/your-user/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

This symlinks all configs to their expected locations. Existing files are backed up to `.bak`.

## Structure

```
├── nvim/          # Neovim config (rocks.nvim + which-key + telescope)
│   ├── init.lua
│   └── rocks.toml
├── tmux/          # Tmux config (C-Space prefix, tmux2k theme)
│   └── .tmux.conf
├── zsh/           # Zsh config (oh-my-zsh, aliases, OS-aware)
│   └── .zshrc
├── .vimrc         # Legacy vim config
└── install.sh
```
