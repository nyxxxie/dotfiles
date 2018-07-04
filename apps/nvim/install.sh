#!/bin/bash

NVIM_VERSION='v0.3.0'
NVIM_CONFIG="$HOME/.config/nvim/"

mkdir -p "$NVIM_CONFIG"

# Install neovim
wget "https://github.com/neovim/neovim/releases/download/$NVIM_VERSION/nvim.appimage" -O $HOME/bin/nvim.appimage && \
chmod +x $HOME/bin/nvim.appimage && \
ln -s $HOME/bin/nvim.appimage $HOME/bin/nvim && \
cp ./config/init.vim "$NVIM_CONFIG/init.vim"

# install Python support for neovim
pip3 install --user neovim

# Install neovim plugin manager
curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
