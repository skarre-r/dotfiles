# abbreviations (aliases): https://fishshell.com/docs/current/cmds/abbr.html

# git
abbr --add "grv" git remote -v

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

# misc
abbr --add "pager" bat --paging=always
