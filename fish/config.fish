
# remove the welcom message
set -U fish_greeting

# init starship
starship init fish | source

# init fzf
fzf --fish | source

# source shell aliases
if test -e $HOME/.aliases
    source $HOME/.aliases
end
