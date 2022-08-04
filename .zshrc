[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && . "$HOME/.fig/shell/zshrc.pre.zsh"

PROMPT='%~ $ '
CLICOLOR=1

# oh my zsh
export ZSH="$HOME/.oh-my-zsh";

ZSH_THEME=""  # simple?

plugins=(
    docker
    docker-compose
    dotenv
    fig
    git
    golang
    helm
    macos
    npm
    oc
    pip
    poetry
    python
    rust
    screen
    sublime
    sudo
    virtualenv
    vscode
)
source $ZSH/oh-my-zsh.sh


source ~/.exports
source ~/.aliases
source ~/.functions


[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && . "$HOME/.fig/shell/zshrc.post.zsh"
