#!/usr/bin/env zsh

# install homebrew: https://brew.sh
# TODO: install packages from the Brewfile
which -s brew
if [[ $? != 0 ]]; then
    echo "Homebrew is not installed"
    echo "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed"
fi

echo
exit 0
