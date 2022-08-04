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
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    echo "oh-my-zsh is not installed"
    echo "Installing oh-my-zsh..."
    /bin/bash -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "oh-my-zsh is already installed"
fi

# install 'spaceship' theme for oh-my-zsh: https://spaceship-prompt.sh
if [[ -d "$HOME/.oh-my-zsh" ]]; then
    if [[ ! -d "$ZSH_CUSTOM/themes/spaceship-prompt" ]]; then
        echo "Spaceship theme is not install"
        echo "Installing spaceship theme..."
        git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
        ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
    else
        echo "Spaceship theme is already installed"
    fi
fi

exit 0
