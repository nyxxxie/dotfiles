#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"  # https://stackoverflow.com/q/59895

# Clean up any resource that might exist from a previous install
. "$DIR/uninstall.sh"

# Install oh-my-zsh
git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh"

# Install zsh theme
mkdir -p $HOME/.oh-my-zsh/custom/themes
ln -s "$DIR/config/nyx.zsh-theme" "$HOME/.oh-my-zsh/custom/themes"

# Install zsh syntax highlighter
#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"

# Install zsh autosuggestions
git clone git://github.com/zsh-users/zsh-autosuggestions "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"

# Install additional zsh completions
git clone https://github.com/zsh-users/zsh-completions "$HOME/.oh-my-zsh/custom/plugins/zsh-completions"

# Copy in this zsh config
ln -s "$DIR/config/zshrc" "$HOME/.zshrc"
