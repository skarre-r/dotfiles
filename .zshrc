PROMPT='%~ $ '
CLICOLOR=1

alias ls='ls -lG'
alias cd..='cd ..'
alias dush='du -sh *'

cdl() { cd "$@" && ls; }
b64() { echo -n "${1}" | base64; }

# python poetry
make-virtualenv () {
	if [[ -f pyproject.toml ]]; then
		poetry config virtualenvs.in-project true
		poetry shell
	else
        echo "pyproject.toml not found"
	fi
}
alias mkenv='make-virtualenv'
alias mkvenv='make-virtualenv'

activate-virtualenv() {
	if [[ -f pyproject.toml && -d .venv ]]; then
		poetry shell
	else
		echo "virtualenv not found"
	fi
}
alias acenv='activate-virtualenv'
alias acvenv='activate-virtualenv'

# django
pysh() { python3 manage.py shell -i ipython; }
runserver() { python3 manage.py runserver 127.0.0.1:8080; }
makemigrations() { python3 manage.py makemigrations; }
migrate() { python3 manage.py migrate; }
alias manage='python3 manage.py'

# git
alias g='git'
## status 
alias gs='git status -sb'
alias gst='git status'
## add
alias add='git add'
## commit
alias cmt='git commit -m'
alias amend='git commit --amend'
## push
alias gp='git push'
alias gpush='git push'
alias push='git push'
## push branch to origin
alias origin='git push -u origin'
## pull
alias pull='git pull'
## log
alias gl='git log --oneline -n 20'
alias glog='git log --oneline'
## diff
alias gif='git diff'
# diff --staged
alias gifs='git diff --staged'
## branch
alias gb='git branch'
## branch delete
alias gbd='git branch -D'
## checkout
alias checkout='git checkout'
## discard
alias discard='git checkout --'
## push no ci pipeline
alias pushnoci='git push -o ci.skip'
# git checkout new branch and push branch to origin
new-branch() {
	if [[ -d .git ]]; then
		git checkout -b "$1" && git push -u origin "$1"
	fi
}
# git commit with title and message body
cmtm() {
	if [[ -d .git ]]; then
		git commit -m "$1" -m "$2"
	fi
}
