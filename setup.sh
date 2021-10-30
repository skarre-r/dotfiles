#!/usr/bin/env zsh

if [[ -f "$HOME/.zshrc" ]]; then
    echo "$HOME/.zshrc already exists"
else
    ln -s "$PWD/.zshrc" "$HOME/.zshrc"
    echo ".zshrc symlink created: $PWD/.zshrc > $HOME/.zshrc"
fi
echo

if [[ -f "$HOME/.bash_profile" ]]; then
    echo "$HOME/.bash_profile already exists"
else
    ln -s "$PWD/.bash_profile" "$HOME/.bash_profile"
    echo ".bash_profile symlink created: $PWD/.bash_profile > $HOME/.bash_profile"
fi

exit 0