
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
enable_transience

# init fzf
fzf --fish | source

# source shell aliases
if test -e $HOME/.aliases
    source $HOME/.aliases
end
