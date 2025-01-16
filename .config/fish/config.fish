
# remove the welcom message
set -U fish_greeting

# init starship
function starship_transient_prompt_func
  starship module character
end

function starship_transient_rprompt_func
  starship module time
end

starship init fish | source
#enable_transience

# init fzf
if command -v fzf > /dev/null
    fzf --fish | source
end

# source shell aliases
if test -e $HOME/.aliases
    source $HOME/.aliases
end

# source environment variables
if test -e $HOME/.exports
    source $HOME/.exports
end

# binds
bind -k up fzf-history-widget
bind \e\[A fzf-history-widget
