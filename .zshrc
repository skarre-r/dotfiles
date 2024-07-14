#!/usr/bin/env zsh

PROMPT='%~ $ '
CLICOLOR=1

# environment variables
export LANG=en_US.UTF-8
export EDITOR='vim'
export XDG_CONFIG_HOME="$HOME/.config"
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship.toml"
export POETRY_HOME="$XDG_CONFIG_HOME/pypoetry"
export POETRY_DATA_DIR="$XDG_CONFIG_HOME/pypoetry"
export POETRY_CACHE_DIR="$XDG_CONFIG_HOME/pypoetry"
export POETRY_CONFIG_DIR="$XDG_CONFIG_HOME/pypoetry"
export FPATH="$HOME/.zsh_site_functions:$FPATH"
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_BUNDLE_INSTALL_CLEANUP=1

# keybindings
bindkey -e
bindkey "^[b" backward-word
bindkey '^[f' forward-word
bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word

# aliases
alias ..='cd ..'
alias cd..='cd ..'
alias ls='ls -lGa'
alias lsa='ls -lGa'
alias dush='du -sh *'

# git aliases
alias g='git'
alias gs='git status -sb'
alias gst='git status'
alias add='git add'
alias cmt='git commit -m'
alias amend='git commit --amend'
alias push='git push'
alias pull='git pull'
alias gl='git --no-pager log --oneline -n 20'
alias glog='git log --oneline'
alias gif='git --no-pager diff'
alias gifs='git --no-pager diff --staged'
alias gb='git --no-pager branch'
alias gbd='git branch -D'
alias checkout='git checkout'
alias discard='git checkout --'
alias gsl='git stash list'
alias gsp='git stash pop'
alias gsa='git stash apply'
alias gss='git stash save'

## docker / podman aliases
alias dps='docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Names}}\t{{.State}}\t{{.RunningFor}}\t{{.Status}}\t{{.Networks}}"'
alias dpsp='docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Names}}\t{{.State}}\t{{.RunningFor}}\t{{.Status}}\t{{.Networks}}\t{{.Ports}}"'
alias pps='podman ps -a'
alias ppw='podman ps -a -w 1'
alias ppsw='podman ps -a -w 1'
alias ppk='podman kube play'
alias pkp='podman kube play'
alias pkr='podman kube play --replace'
alias pkd='podman kube down'

# functions
so() {
    if [ -f $HOME/.zshrc ]; then
        source $HOME/.zshrc
    fi
}

gbn() {
	if [[ -d .git ]]; then
		git checkout -b "$1" && git push -u origin "$1"
	fi
}

symlink() {
	if type gln &>/dev/null; then
		gln -svT "$1" "$2"
	else
		ln -sv "$1" "$2"
	fi
}

# iterm2 shell integration
if [ -f $HOME/.iterm2_shell_integration.zsh ]; then
	source "$HOME/.iterm2_shell_integration.zsh"
fi

# homebrew + completions
if [[ -v HOMEBREW_PREFIX ]]; then
	eval "$($HOMEBREW_PREFIX/bin/brew shellenv)"

	export FPATH="$HOMEBREW_PREFIX/share/zsh/site-functions:$FPATH"
	export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR="$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/highlighters"

	source "$HOMEBREW_PREFIX/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh"
	source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
	source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
	source "$HOMEBREW_PREFIX/share/zsh-history-substring-search/zsh-history-substring-search.zsh"
fi

# starship prompt
eval "$(starship init zsh)"
