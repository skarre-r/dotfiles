#!/usr/bin/env zsh

# https://stackoverflow.com/a/20434740
dotfiles_directory="$( cd "$( dirname "$0" )" && pwd )"


symlink_dotfile() {
    file=$1

    source="$dotfiles_directory/$file"
    destination="$HOME/$file"

    if [[ -f "$destination" ]]; then
        echo "$file: $destination already exists"
    else
        ln -s "$source" "$destination"
        echo "$file: $source >>> $destination — symlink created"
    fi
}


for file_name in $(ls -a $dotfiles_directory); do
    # find dotfiles
    if [[ $file_name == .* ]]; then
        # ignore 'current dir', 'parent dir', and the '.git' directory
        if [[ "$file_name" != "." ]] && [[ $file_name != ".." ]] && [[ $file_name != ".git" ]]; then
            # run the 'symlink_dotfile' function
            symlink_dotfile $file_name
        fi
    fi
done

exit 0