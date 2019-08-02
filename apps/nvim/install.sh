#!/bin/bash

NVIM_VERSION='v0.3.8'
NVIM_CONFIG="$HOME/.config/nvim"
NVIM_BIN="$HOME/bin/nvim_bin"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"  # https://stackoverflow.com/q/59895

# Clean up any resource that might exist from a previous install
. "$DIR/uninstall.sh"

# Install neovim
if ! type "nvim" > /dev/null 2>&1; then
    # Make a bin directory for us to put the appimage in
    mkdir -p "$NVIM_BIN"

    if [[ "$OSTYPE" == "linux-gnu" ]]; then
        # Download the app image, make it executable, symlink it to
        curl "https://github.com/neovim/neovim/releases/download/$NVIM_VERSION/nvim.appimage" -fLo "$NVIM_BIN/nvim.appimage" && \
        chmod +x "$NVIM_BIN/nvim.appimage" && \
        ln -s "$HOME/bin/nvim/nvim.appimage" "$HOME/bin/nvim"
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        # Download the tar and extract it in the right place
        curl "https://github.com/neovim/neovim/releases/download/$NVIM_VERSION/nvim-macos.tar.gz" -fLo "$NVIM_BIN/nvim.tar.gz" && \
        tar xzvf "$NVIM_BIN/nvim.tar.gz" -C "$NVIM_BIN" && \
        ln -s "$NVIM_BIN/nvim-osx64/bin/nvim" "$HOME/bin/nvim" && \
        rm "$NVIM_BIN/nvim.tar.gz"
    else
        echo "ERROR: Unsupported neovim install platform $OSTYPE"
        exit 1
    fi
fi

# Install the config file
mkdir -p "$NVIM_CONFIG"
ln -s "$DIR/config/init.vim" "$NVIM_CONFIG/init.vim"

# Install the nvim theme
mkdir -p "$NVIM_CONFIG/colors/"
ln -s "$DIR/config/nyx-theme.vim" "$NVIM_CONFIG/colors/nyx.vim"

# Install the airline theme
mkdir -p "$NVIM_CONFIG/autoload/airline/themes"
ln -s "$DIR/config/nyx-airline-theme.vim" "$NVIM_CONFIG/autoload/airline/themes/nyx.vim"

# install Python support for neovim
# TODO: find some way of verifying python is installed.  Maybe have a thing in dotfiles to install it manually if it doesn't exist?
if [[ "$OSTYPE" == "darwin"* ]]; then
    /usr/local/bin/pip3 install neovim pynvim
    /usr/local/bin/pip3 install --upgrade neovim pynvim
else
    pip3 install --user neovim pynvim
    pip3 install --user --upgrade neovim pynvim
fi

# Install neovim plugin manager
curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim" --create-dirs \
    "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

# Install neovim plugins
echo "Installing neovim plugins, this might take a minute or two."
nvim +PlugInstall +qa > /dev/null

# Extra step for macos -- tell iterm2 to allow terminal apps to access clipboard
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "IMPORTANT: Please enable "Allow clipboard access to terminal apps" in iterm2 settings."
    #read -n 1 -p "Press any key to continue."
fi
