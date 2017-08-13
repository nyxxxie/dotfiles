#!/bin/bash

# Install spacemacs
git clone https://github.com/syl20bnr/spacemacs -b develop ~/.emacs.d

# Link config dir
ln -s $HOME/.dotfiles/config/spacemacs/ ~/.spacemacs.d

# Link theme into private dir
ln -s $HOME/.dotfiles/config/spacemacs/private/local/nyx-dark-theme \
    ~/.emacs.d/private/local/
