[[ -f "$HOME/.fig/shell/bash_profile.pre.bash" ]] && . "$HOME/.fig/shell/bash_profile.pre.bash"

PROMPT='%~ $ '
CLICOLOR=1

source $HOME/.exports
source $HOME/.aliases
source $HOME/.functions

[[ -f "$HOME/.fig/shell/bash_profile.post.bash" ]] && . "$HOME/.fig/shell/bash_profile.post.bash"
