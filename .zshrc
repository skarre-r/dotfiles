#!/usr/bin/env zsh

PROMPT='%~ $ '
CLICOLOR=1

# TODO: bind CMD+Backspace to 'backward-kill-line'
bindkey -e
bindkey "^[[1;3D" backward-word             # Option+Left
bindkey "^[[1;3C" forward-word              # Option+Right
bindkey "^[[1;9D" beginning-of-line         # Command+Left
bindkey "^[[1;9C" end-of-line               # Command+Right
bindkey "^[[H" beginning-of-line            # Home
#bindkey "^[[D" beginning-of-line            # ???
bindkey "^[[F" end-of-line                  # End
#bindkey "^[[C" end-of-line                  # ???
bindkey "^[[A" history-search-backward      # Up
bindkey "^[[B" history-search-forward       # Down
bindkey '^[^?' backward-kill-word           # Option+Backspace

if [ -f $HOME/.aliases ]; then
    source "$HOME/.aliases"
fi

if [ -f $HOME/.exports ]; then
    source "$HOME/.exports"
fi

if [ -f $HOME/.functions ]; then
    source "$HOME/.functions"
fi

if [ -d /opt/homebrew ]; then
	source "/opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh"
	source "/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
	source "/opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
	source "/opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh"
fi

autoload -Uz compinit
compinit

if command -v fzf > /dev/null; then
    source <(fzf --zsh)
fi

eval "$(starship init zsh)"
