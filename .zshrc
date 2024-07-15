#!/usr/bin/env zsh

PROMPT='%~ $ '
CLICOLOR=1

if [ -f $HOME/.aliases ]; then
    source "$HOME/.aliases"
fi

if [ -f $HOME/.exports ]; then
    source "$HOME/.exports"
fi

if [ -f $HOME/.functions ]; then
    source "$HOME/.functions"
fi

if [ -f $HOME/.iterm2_shell_integration.zsh ]; then
	source "$HOME/.iterm2_shell_integration.zsh"
fi

if [ -d /opt/homebrew ]; then
	source "/opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh"
	source "/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
	source "/opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
	source "/opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh"
fi

eval "$(starship init zsh)"
