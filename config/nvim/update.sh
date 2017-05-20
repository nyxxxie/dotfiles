#!/bin/bash

# Upgrade the python depdendency
pip2 install --user --upgrade neovim
pip3 install --user --upgrade neovim

# Update plugins
nvim -c ':PlugUpdate | q | q'
