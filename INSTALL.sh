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

# install oh-my-zsh: https://ohmyz.sh
if [[ -d "$HOME/.oh-my-zsh" ]]; then
    echo "oh-my-zsh is already installed"
else
    echo "oh-my-zsh is not installed"
    echo "Installing oh-my-zsh..."
    /bin/bash -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

exit 0
