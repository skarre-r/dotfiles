#!/usr/bin/env zsh

PROMPT='%~ $ '
CLICOLOR=1

bindkey -e
bindkey "^[[1;3D" backward-word             # Option+Left
bindkey "^[[1;3C" forward-word              # Option+Right
bindkey "^[[1;9D" beginning-of-line         # Command+Left
bindkey "^[[1;9C" end-of-line               # Command+Right
bindkey "^[[H" beginning-of-line            # Home
bindkey "^[[F" end-of-line                  # End
bindkey "^[[A" history-search-backward      # Up
bindkey "^[[B" history-search-forward       # Down
bindkey '^[^?' backward-kill-word           # Option+Backspace
# bindkey "^[[D" beginning-of-line
# bindkey "^[[C" end-of-line

if [ -f $HOME/.aliases ]; then
    source "$HOME/.aliases"
fi

if [ -f $HOME/.exports ]; then
    source "$HOME/.exports"
fi

if [ -f $HOME/.functions ]; then
    source "$HOME/.functions"
fi

# remove duplicate entries in $PATH
typeset -U path

# zsh-autocomplete
if [[ "$ZSH_AUTOCOMPLETE_PATH" != "" ]]; then
    if [[ -f "$ZSH_AUTOCOMPLETE_PATH/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh" ]]; then
        source "$ZSH_AUTOCOMPLETE_PATH/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh"
    fi
fi

if command -v atuin > /dev/null; then
    eval "$(atuin init zsh)"
fi

if command -v fzf > /dev/null; then
    source <(fzf --zsh)
fi

if command -v starship > /dev/null; then
    eval "$(starship init zsh)"
fi
