
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

if [ -f $HOME/.iterm2_shell_integration.bash ]; then
    source $HOME/.iterm2_shell_integration.bash
fi

eval "$(starship init bash)"
