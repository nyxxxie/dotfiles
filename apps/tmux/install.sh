#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"  # https://stackoverflow.com/q/59895

# Copy in the tmux config
rm "$HOME/.tmux.conf"
ln -s "$DIR/config/tmux.conf" "$HOME/.tmux.conf"
