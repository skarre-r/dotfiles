
# remove the welcome message
set -U fish_greeting

# source abbreviations
if test -e $HOME/.config/fish/abbreviations.fish
    source $HOME/.config/fish/abbreviations.fish
end

# source environment variables
if test -e $HOME/.exports
    source $HOME/.exports
end

# fix homebrew vs nix paths
fish_add_path --path --move "/nix/var/nix/profiles/default/bin"
fish_add_path --path --move "/run/current-system/sw/bin"
fish_add_path --path --move "/etc/profiles/per-user/$(/usr/bin/whoami)/bin"
fish_add_path --path --move "/Users/$(/usr/bin/whoami)/.nix-profile/bin"

# interactive
if status is-interactive
    # starship
    if command -v starship > /dev/null
        starship init fish | source
    end

    # history
    if command -v atuin > /dev/null
        atuin init fish | source
    end

    # fzf
    if command -v fzf > /dev/null
        fzf --fish | source
    end

    if command -v zoxide > /dev/null
        zoxide init fish | source
    end
end
