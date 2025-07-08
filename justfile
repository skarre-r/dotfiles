set dotenv-load := true

# List recipes
default:
    @just --list


# Check if 'nix' is installed
[group("nix")]
_check_nix:
    #!/usr/bin/env bash
    if [[ ! `command -v nix` ]]; then exit 1; fi

# Check if 'nix-darwin' is installed
[group("nix")]
_check_nix_darwin:
    #!/usr/bin/env bash
    if [[ ! `command -v darwin-rebuild` ]]; then exit 1; fi

# Check if the 'NIX_MODULE' environment variable is set
[group("nix")]
_check_nix_module:
    #!/usr/bin/env bash
    if [ "${NIX_MODULE}" == "" ]; then exit 1; fi
    if [ "${NIX_MODULE}" != "home" ] && [ "${NIX_MODULE}" != "work" ]; then exit 1; fi

# Update nix flake
[group("nix")]
update: _check_nix
    nix flake update

# Run darwin-rebuild
[group("nix")]
rebuild module: _check_nix _check_nix_darwin
    sudo darwin-rebuild switch --flake "{{justfile_directory()}}#{{module}}"

alias build := rebuild

# Run darwin-rebuild w/ the current NIX_MODULE
[group("nix")]
nix: _check_nix_module (rebuild env("NIX_MODULE"))


# Check if 'stow' is installed
[group("stow")]
_check_stow:
    #!/usr/bin/env bash
    if [[ ! `command -v stow` ]]; then exit 1; fi

# Symlink dotfiles
[group("stow")]
stow: _check_stow
    stow --dir="{{justfile_directory()}}" --target="{{home_directory()}}" --stow .

# Re-symlink dotfiles
[group("stow")]
restow: _check_stow
    stow --dir="{{justfile_directory()}}" --target="{{home_directory()}}" --restow .

# Remove dotfile symlinks
[group("stow")]
unstow: _check_stow
    stow --dir="{{justfile_directory()}}" --target="{{home_directory()}}" --delete .
