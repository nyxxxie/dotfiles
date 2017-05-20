#!/bin/bash
mkdir ~/.config/
ln -s ~/.dotfiles/config/nvim ~/.config/

# Install python depdenceny required by some plugins
pip2 install --user neovim
pip3 install --user neovim

# Install plugin manager
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install plugins
nvim -c ':PlugInstall | q | q'
