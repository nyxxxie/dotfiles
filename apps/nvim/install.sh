#!/bin/bash

NVIM_VERSION='v0.3.7'
NVIM_CONFIG="$HOME/.config/nvim/"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"  # https://stackoverflow.com/q/59895

rm -rf "$NVIM_CONFIG" "$HOME/bin/nvim*"

# Install neovim
if ! type "nvim" > /dev/null; then
    # Make a bin directory for us to put the appimage in
    mkdir -p $HOME/bin/

    if [[ "$OSTYPE" == "linux-gnu" ]]; then
        # Download the app image, make it executable, symlink it to
        wget "https://github.com/neovim/neovim/releases/download/$NVIM_VERSION/nvim.appimage" -O $HOME/bin/nvim.appimage && \
        chmod +x $HOME/bin/nvim.appimage && \
        ln -s $HOME/bin/nvim.appimage $HOME/bin/nvim
    elif [[ "$OSTYPE" == "linux-gnu" ]]; then
        # Download the tar and extract it in the right place
        wget "https://github.com/neovim/neovim/releases/download/$NVIM_VERSION/nvim-macos.tar.gz" -O $HOME/bin/nvim.tar.gz && \
        tar xzvf $HOME/bin/nvim.tar.gz && \
        ln -s $HOME/bin/nvim-osx64/bin/nvim $HOME/bin/nvim && \
        rm $HOME/bin/nvim.tar.gz
    else
        echo "ERROR: Unsupported neovim install platform $OSTYPE"
        exit 1
    fi
fi

# Install the config file
mkdir -p "$NVIM_CONFIG"
ln -s "$DIR/config/init.vim" "$NVIM_CONFIG/init.vim"

# install Python support for neovim
if [[ "$OSTYPE" == "darwin"* ]]; then
    brew install python
    /usr/local/bin/pip3 install neovim pynvim
    /usr/local/bin/pip3 install --upgrade neovim pynvim
else
    pip3 install --user neovim pynvim
    pip3 install --user --upgrade neovim pynvim
fi

# Install neovim plugin manager
curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Extra step for macos -- tell iterm2 to allow terminal apps to access clipboard
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "IMPORTANT: Please enable "Allow clipboard access to terminal apps" in iterm2 settings."
    read -n 1 -p "Press any key to continue."
fi
