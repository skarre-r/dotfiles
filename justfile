set dotenv-load := true

# list recipes
default:
    @just --list

alias help := default

# check if 'nix' is installed
[group("nix")]
_check_nix:
    #!/usr/bin/env bash
    if [[ ! `command -v nix` ]]; then exit 1; fi

# check if 'nix-darwin' is installed
[group("nix")]
_check_nix_darwin:
    #!/usr/bin/env bash
    if [[ ! `command -v darwin-rebuild` ]]; then exit 1; fi

# check if the 'NIX_MODULE' environment variable is set
[group("nix")]
_check_nix_module:
    #!/usr/bin/env bash
    if [ "${NIX_MODULE}" == "" ]; then exit 1; fi
    if [ "${NIX_MODULE}" != "home" ] && [ "${NIX_MODULE}" != "work" ]; then exit 1; fi

# update nix flake
[group("nix")]
update: _check_nix
    nix flake update

# run darwin-rebuild
[group("nix")]
rebuild module: _check_nix _check_nix_darwin
    sudo darwin-rebuild switch --flake "{{justfile_directory()}}#{{module}}"

alias build := rebuild

# run darwin-rebuild w/ the current NIX_MODULE
[group("nix")]
nix: _check_nix_module (rebuild env("NIX_MODULE"))

# run nix garbage collection
[group("nix")]
gc:
    #!/usr/bin/env bash
    if [[ `command -v nix-collect-garbage` ]]; then
        sudo nix-collect-garbage --delete-old
    else
        echo "nix-collect-garbage not found"
        exit 1
    fi


# check if 'stow' is installed
[group("stow")]
_check_stow:
    #!/usr/bin/env bash
    if [[ ! `command -v stow` ]]; then exit 1; fi

# symlink dotfiles
[group("stow")]
stow: _check_stow
    stow --dir="{{justfile_directory()}}" --target="{{home_directory()}}" --stow .

# re-symlink dotfiles
[group("stow")]
restow: _check_stow
    stow --dir="{{justfile_directory()}}" --target="{{home_directory()}}" --restow .

# remove dotfile symlinks
[group("stow")]
unstow: _check_stow
    stow --dir="{{justfile_directory()}}" --target="{{home_directory()}}" --delete .
