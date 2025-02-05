
# remove the welcome message
set -U fish_greeting

# init starship
function starship_transient_prompt_func
  starship module character
end

function starship_transient_rprompt_func
  starship module time
end

starship init fish | source
#enable_transience # TODO

# init fzf
if command -v fzf > /dev/null
    fzf --fish | source
end

# source abbreviations
if test -e $HOME/.config/fish/abbr.fish
    source $HOME/.config/fish/abbr.fish
end

# source shell aliases
if test -e $HOME/.aliases
    source $HOME/.aliases
end

# source environment variables
if test -e $HOME/.exports
    source $HOME/.exports
end

# homebrew
if test -e /opt/homebrew/bin/brew
    /opt/homebrew/bin/brew shellenv | source
end

# fix homebrew vs nix paths
fish_add_path --path --move "/nix/var/nix/profiles/default/bin"
fish_add_path --path --move "/run/current-system/sw/bin"
fish_add_path --path --move "/etc/profiles/per-user/$(/usr/bin/whoami)/bin"
fish_add_path --path --move "/Users/$(/usr/bin/whoami)/.nix-profile/bin"

# binds
bind -k up fzf-history-widget
bind \e\[A fzf-history-widget
