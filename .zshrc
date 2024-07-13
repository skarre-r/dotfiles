#!/usr/bin/env zsh

PROMPT='%~ $ '
CLICOLOR=1

# environment variables
export EDITOR='vim'

export XDG_CONFIG_HOME="$HOME/.config"
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship.toml"
export POETRY_HOME="$XDG_CONFIG_HOME/pypoetry"
export POETRY_DATA_DIR="$XDG_CONFIG_HOME/pypoetry"
export POETRY_CACHE_DIR="$XDG_CONFIG_HOME/pypoetry"
export POETRY_CONFIG_DIR="$XDG_CONFIG_HOME/pypoetry"

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_BUNDLE_INSTALL_CLEANUP=1

# keybindings
bindkey -e
bindkey "^[b" backward-word
bindkey '^[f' forward-word
bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word

# aliases
alias ls='ls -lG'
alias lsa='ls -lGa'
alias ..='cd ..'
alias cd..='cd ..'
alias dush='du -sh *'
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
alias dps='docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Names}}\t{{.State}}\t{{.RunningFor}}\t{{.Status}}\t{{.Networks}}"'
alias dpsp='docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Names}}\t{{.State}}\t{{.RunningFor}}\t{{.Status}}\t{{.Networks}}\t{{.Ports}}"'
alias symlink='ln -s'

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

	# zsh plugins
	if [ -f $HOMEBREW_PREFIX/share/antigen/antigen.zsh ]; then
		source $HOMEBREW_PREFIX/share/antigen/antigen.zsh
		antigen bundle zsh-users/zsh-completions
		antigen bundle zsh-users/zsh-autosuggestions
		antigen bundle zsh-users/zsh-syntax-highlighting
		antigen bundle zsh-users/zsh-history-substring-search
		antigen apply
	fi
fi

# completions
autoload -Uz compinit; compinit

# starship
eval "$(starship init zsh)"
