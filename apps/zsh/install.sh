#!/bin/bash

# Install oh-my-zsh
git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh"

# Install zsh theme
mkdir -p $HOME/.oh-my-zsh/custom/themes
cp ./config/nyx.zsh-theme "$HOME/.oh-my-zsh/custom/themes"

# Install zsh syntax highlighter
#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"

# Install zsh autosuggestions
git clone git://github.com/zsh-users/zsh-autosuggestions "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"

# Install additional zsh completions
git clone https://github.com/zsh-users/zsh-completions "$HOME/.oh-my-zsh/custom/plugins/zsh-completions"

# Copy in this zsh config
cp ./config/zshrc "$HOME/.zshrc"
