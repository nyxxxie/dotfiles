#!/bin/bash

# Print banner
echo '  _   _            _     '
echo ' | \ | |_   ___  _( )___ '
echo ' |  \| | | | \ \/ /// __|'
echo ' | |\  | |_| |>  <  \__ \'
echo ' |_| \_|\__, /_/\_\ |___/'
echo '        |___/            '
echo '  ____        _    __ _ _           '
echo ' |  _ \  ___ | |_ / _(_) | ___  ___ '
echo ' | | | |/ _ \| __| |_| | |/ _ \/ __|'
echo ' | |_| | (_) | |_|  _| | |  __/\__ \'
echo ' |____/ \___/ \__|_| |_|_|\___||___/'
echo ''
echo ' installer v0.1'
echo '+--------------------------------------'

# Locate python
echo -n 'Looking for python3...'
command -v python3 >/dev/null 2>&1 || { echo 'Failed!'; exit 1; }
echo 'Located!'

# Locate pip
echo -n 'Looking for pip3...'
command -v pip3 >/dev/null 2>&1 || { echo 'Failed!'; exit 1; }
echo 'Located!'

# Install requirements
echo -n 'Installing python script requirements...'
command -v pip3 install --user -r ./scripts/installer/requirements.txt >/dev/null 2>&1 || { echo 'Failed!'; exit 1; }
echo 'Done!'

# Launching tui
echo 'Launching TUI...'
python3 ./scripts/installer/installer.py
