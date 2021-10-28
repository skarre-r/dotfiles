#!/usr/bin/env zsh

current_dir=$(pwd)
user=$(whoami)
user_dir="/Users/$user"

if [[ -f "$user_dir/.zshrc" ]]; then
    echo "$user_dir/.zshrc already exists"
else
    ln -s "$current_dir/.zshrc" "$user_dir/.zshrc"
    echo ".zshrc symlink created: $current_dir/.zshrc > $user_dir/.zshrc"
fi

if [[ -f "$user_dir/.bash_profile" ]]; then
    echo "$user_dir/.bash_profile already exists"
else
    ln -s "$current_dir/.bash_profile" "$user_dir/.bash_profile"
    echo ".bash_profile symlink created: $current_dir/.bash_profile > $user_dir/.bash_profile"
fi



exit 0