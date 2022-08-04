[[ -f "$HOME/.fig/shell/bash_profile.pre.bash" ]] && . "$HOME/.fig/shell/bash_profile.pre.bash"

PROMPT='%~ $ '
CLICOLOR=1

source ~/.exports
source ~/.aliases
source ~/.functions


[[ -f "$HOME/.fig/shell/bash_profile.post.bash" ]] && . "$HOME/.fig/shell/bash_profile.post.bash"
