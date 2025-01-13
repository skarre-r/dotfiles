#!/usr/bin/env sh

if [ -d "/opt/homebrew" ]; then
    if ! command -v brew 2> /dev/null
    then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
fi
