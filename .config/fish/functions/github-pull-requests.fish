
function github-pull-requests -a action
    if ! command -v gh > /dev/null
        echo "gh is not installed!"
        return 1
    end
    if ! command -v fzf > /dev/null
        echo "fzf is not installed!"
        return 1
    end
    if ! git rev-parse --is-inside-work-tree &> /dev/null
        echo "failed to run git: fatal: not a git repository (or any of the parent directories): .git"
        return 1
    end

    if not contains $action "open" "close" "merge" "squash"
        echo "github-pull-requests [open|close|merge|squash]"
        return 1
    end

    set -f prs (gh pr list --json number,title,headRefName,labels --template '{{range .}}{{tablerow .number .title .headRefName}}{{end}}' | fzf --reverse --multi --accept-nth=1)
    if not test -n "$prs"
        return 1
    end

    switch $action
    case "open"
        for pr in $prs
            gh pr view "$pr" --web
        end
        return 0
    case "close"
        for pr in $prs
            gh pr close "$pr"
        end
        return 0
    case "merge"
        for pr in $prs
            gh pr merge "$pr" --merge
        end
        return 0
    case "squash"
        for pr in $prs
            gh pr merge "$pr" --squash
        end
        return 0
    end
end
