[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && . "$HOME/.fig/shell/zshrc.pre.zsh"

PROMPT='%~ $ '
CLICOLOR=1

source $HOME/.oh-my-zshrc
source $HOME/.exports
source $HOME/.aliases
source $HOME/.functions

[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && . "$HOME/.fig/shell/zshrc.post.zsh"
