#!/usr/bin/env bash

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

if command -v starship > /dev/null; then
    eval "$(starship init bash)"
fi

if command -v atuin > /dev/null; then
    eval "$(atuin init bash)"
fi

if command -v fzf > /dev/null; then
    eval "$(fzf --bash)"
fi
