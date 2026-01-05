# abbreviations (aliases): https://fishshell.com/docs/current/cmds/abbr.html

# cd / zoxide
abbr --add "cd" z

# ls / eza
abbr --add "ls" eza -l
abbr --add "lsa" eza -la

# find / fd
abbr --add "find" fd

# cat / bat
abbr --add "cat" bat --paging=never

# git
abbr --add "g" git
abbr --add "gs" git status -sb
abbr --add "gst" git status
abbr --add "grv" git remote -v
abbr --add "gl" git --no-pager log --oneline -n 20
abbr --add "glog" git log --oneline
abbr --add "gif" git --no-pager diff
abbr --add "gifs" git --no-pager diff --staged
abbr --add "gb" git --no-pager branch
abbr --add "gbd" git branch -D
abbr --add "gsl" git stash list
abbr --add "gsp" git stash pop
abbr --add "gsa" git stash apply
abbr --add "gss" git stash save
abbr --add "gssa" git stash save --include-untraced
abbr --add "gfp" git fetch --prune

abbr --add "add" git add
abbr --add "adda" git update-index --again
abbr --add "cmt" git commit -m
abbr --add "amend" git commit --amend
abbr --add "push" git push
abbr --add "pull" git pull
abbr --add "checkout" git switch
abbr --add "restore" git restore
abbr --add "discard" git restore

# git tui
abbr --add "lg" lazygit

# github cli
abbr --add "github" gh
abbr --add "prs" gh pr list
abbr --add "issues" gh issue list
abbr --add "iss" gh issue list
abbr --add "actions" gh run list
abbr --add "act" gh run view --web

# github cli + fzf fish functions
abbr --add "ghr" github-repo
abbr --add "ghp" github-project
abbr --add "pr" github-pull-requests open
abbr --add "pro" github-pull-requests open
abbr --add "prc" github-pull-requests close
abbr --add "prm" github-pull-requests merge
abbr --add "prms" github-pull-requests squash

# jujutsu
abbr --add "js" jj status
abbr --add "jl" jj log
abbr --add "jd" jj describe
abbr --add "jol" jj operation log
abbr --add "jbc" jj bookmark create
abbr --add "jbs" jj bookmark set
abbr --add "jif" jj diff --git
abbr --add "jgp" jj git push
abbr --add "jgf" jj git fetch

# lazyjj
abbr --add "lj" lazyjj

# vim/ neovim
abbr --add "v" vim
abbr --add "nv" nvim
abbr --add "neovim" nvim

# helix
abbr --add "helix" hx

# tmux
abbr --add "tmux-split-down" tmux split-window
abbr --add "tmux-split-right" tmux split-window -hf

# docker
abbr --add "dps" docker ps --format \"table {{.ID}}\t{{.Image}}\t{{.Names}}\t{{.State}}\t{{.RunningFor}}\t{{.Status}}\t{{.Networks}}\"
abbr --add "dpsp" docker ps --format \"table {{.ID}}\t{{.Image}}\t{{.Names}}\t{{.State}}\t{{.RunningFor}}\t{{.Status}}\t{{.Networks}}\t{{.Ports}}\"

# podman
abbr --add "pps" podman ps -a
abbr --add "ppsw" podman ps -a -w 1
abbr --add "pkp" podman kube play
abbr --add "pkr" podman kube play --replace
abbr --add "pkd" podman kube down
abbr --add "pprmaf" podman pod rm --all --force
abbr --add "pm" podman machine
abbr --add "pms" podman machine start
abbr --add "pmu" podman machine start
abbr --add "pmd" podman machine stop

# misc
abbr --add "pn" pnpm
abbr --add "ff" fastfetch
abbr --add "ip" ipconfig getifaddr en0
abbr --add "dush" du -sh *
abbr --add "week" date +%V
abbr --add "pager" bat --paging=always
abbr --add "plistbuddy" /usr/libexec/PlistBuddy
