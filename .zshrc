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
export FPATH="$HOME/.zsh-site-functions:$FPATH"
export FPATH="$HOMEBREW_PREFIX/share/zsh/site-functions:$FPATH"
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
alias ls='ls -lG'
alias lsa='ls -lGa'
alias dush='du -sh *'
alias symlink='ln -s'
## git
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
## docker / podman
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
gbn() {
	if [[ -d .git ]]; then
		git checkout -b "$1" && git push -u origin "$1"
	fi
}


# iterm2 shell integration
if [ -f $HOME/.iterm2_shell_integration.zsh ]; then
	source "$HOME/.iterm2_shell_integration.zsh"
fi


# homebrew
if [[ -v HOMEBREW_PREFIX ]]; then
	eval "$($HOMEBREW_PREFIX/bin/brew shellenv)"

	# antidote
	if [ -f "$HOMEBREW_PREFIX/opt/antidote/share/antidote/antidote.zsh" ]; then
		source "$HOMEBREW_PREFIX/opt/antidote/share/antidote/antidote.zsh"
		antidote load
	fi
fi


# completions
autoload -Uz compinit
compinit

# starship prompt
eval "$(starship init zsh)"
