#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"  # https://stackoverflow.com/q/59895

# Install the tmux plugin manager
git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"

# Copy in the tmux config
rm "$HOME/.tmux.conf"
ln -s "$DIR/config/tmux.conf" "$HOME/.tmux.conf"
