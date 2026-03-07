#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

link() {
    local src="$1" dst="$2"
    if [ -e "$dst" ] || [ -L "$dst" ]; then
        echo "  backup: $dst -> ${dst}.bak"
        mv "$dst" "${dst}.bak"
    fi
    ln -sf "$src" "$dst"
    echo "  linked: $src -> $dst"
}

echo "==> Neovim"
mkdir -p ~/.config/nvim
link "$DOTFILES/nvim/init.lua"   ~/.config/nvim/init.lua
link "$DOTFILES/nvim/rocks.toml" ~/.config/nvim/rocks.toml

echo "==> Tmux"
link "$DOTFILES/tmux/.tmux.conf" ~/.tmux.conf

echo "==> Zsh"
link "$DOTFILES/zsh/.zshrc" ~/.zshrc

echo "==> Vim (legacy)"
link "$DOTFILES/.vimrc" ~/.vimrc

echo ""
echo "Done! You may need to restart your shell or run 'source ~/.zshrc'."
