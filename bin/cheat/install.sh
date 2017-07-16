#!/usr/bin/env

# Install the cheat program and make a symlink to it
pip3 install --user cheat
ln -s $HOME/.local/bin/cheat ~/bin/cheat

# Ceate our cheatsheet dir
mkdir $HOME/.cheat/

# Copy over some cheatsheets
# TODO: just download + unpack zips instead?
git clone https://github.com/andrewjkerr/security-cheatsheets.git $HOME/.cheat/
rm -rf $HOME/.cheat/.git
