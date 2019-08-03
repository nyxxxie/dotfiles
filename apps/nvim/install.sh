#!/bin/bash

NVIM_VERSION='nightly'
NVIM_CONFIG="$HOME/.config/nvim"
NVIM_BIN="$HOME/bin/nvim_bin"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"  # https://stackoverflow.com/q/59895

# Clean up any resource that might exist from a previous install
. "$DIR/uninstall.sh"

# Install neovim
if ! hash "nvim" 2>/dev/null; then
    # Make a bin directory for us to put the appimage in
    mkdir -p "$NVIM_BIN"

    if [[ "$OSTYPE" == "linux-gnu" ]]; then
        # Download the app image, make it executable, symlink it to
        curl "https://github.com/neovim/neovim/releases/download/$NVIM_VERSION/nvim.appimage" -fLo "$NVIM_BIN/nvim.appimage" && \
        chmod +x "$NVIM_BIN/nvim.appimage" && \
        ln -s "$NVIM_BIN/nvim.appimage" "$HOME/bin/nvim"
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

# Install the coc file
mkdir -p "$NVIM_CONFIG"
ln -s "$DIR/config/coc-settings.json" "$NVIM_CONFIG/coc-settings.json"

# Install the nvim theme
mkdir -p "$NVIM_CONFIG/colors/"
ln -s "$DIR/config/nyx-theme.vim" "$NVIM_CONFIG/colors/nyx.vim"

# Install the airline theme
mkdir -p "$NVIM_CONFIG/autoload/airline/themes"
ln -s "$DIR/config/nyx-airline-theme.vim" "$NVIM_CONFIG/autoload/airline/themes/nyx.vim"

# Install node for CoC plugin
# TODO: move this to a different installer, seems out of scope to install it here
echo "Installing node for coc.nvim."
if ! hash "node" 2>/dev/null; then
    if [[ "$OSTYPE" == "darwin"* ]]; then
        brew install node
    else
        curl -sL install-node.now.sh | sh
    fi
fi

# install Python support for neovim
# TODO: find some way of verifying python is installed.  Maybe have a thing in dotfiles to install it manually if it doesn't exist?
echo "Installing essential python packages."
if [[ "$OSTYPE" == "darwin"* ]]; then
    /usr/local/bin/pip3 install --user --upgrade neovim pynvim
else
    pip3 install --user --upgrade neovim pynvim 'python-language-server[all]'
fi

# Install neovim plugin manager
curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim" --create-dirs \
    "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

# Install neovim plugins
echo "Installing neovim plugins, this might take a minute or two."
nvim +PlugInstall +qa > /dev/null

# Install ctags
# TODO: move this to a different installer, seems out of scope to install it here
echo "Installing ctags."
if ! hash "node" 2>/dev/null; then
    if [[ "$OSTYPE" == "darwin"* ]]; then
        brew install ctags
    else
        echo -e "\033[31;5mDon't know how to install ctags on this platform.\033[0m"
    fi
fi

# Install coc.nvim extensions
# TODO: for more languages: https://github.com/neoclide/coc.nvim/wiki/Language-servers
echo "Installing coc.nvim extension."
mkdir -p "$HOME/.config/coc/extensions"
pushd "$HOME/.config/coc/extensions"
if [ ! -f package.json ]
then
  echo '{"dependencies":{}}'> package.json
fi
npm install --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod \
    coc-python \
    coc-html \
    coc-css \
    coc-json \
    coc-eslint \
    coc-tsserver
popd

# Extra step for macos -- tell iterm2 to allow terminal apps to access clipboard
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo -e "\033[31;5mIMPORTANT: Please enable "Allow clipboard access to terminal apps" in iterm2 settings.\033[0m"
    #read -n 1 -p "Press any key to continue."
fi
