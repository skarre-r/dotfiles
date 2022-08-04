#!/usr/bin/env zsh

# https://stackoverflow.com/a/20434740
dotfiles_directory="$( cd "$( dirname "$0" )" && pwd )"


symlink_dotfile() {
    dotfile=$1
    if [[ -f "$HOME/$dotfile" ]]; then
        echo "WARNING: $HOME/$dotfile already exists"
    else
        ln -s "$dotfiles_directory/$dotfile" "$HOME/$dotfile"
        echo "INFO: $dotfile symlink created ($dotfiles_directory/$dotfile >>> $HOME/$dotfile)"
    fi
}


for file_name in $(ls -a $dotfiles_directory); do
    # find dotfiles
    if [[ $file_name == .* ]]; then
        # ignore 'current dir' & 'parent dir'
        if [[ "$file_name" != "." ]] && [[ $file_name != ".." ]]; then
            # run the 'symlink_dotfile' function
            symlink_dotfile $file_name
        fi
    fi
done

exit 0