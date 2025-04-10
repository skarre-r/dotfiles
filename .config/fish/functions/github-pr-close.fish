function github-pr-close
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

    set -f prs (gh pr list --json number,title,headRefName,labels --template '{{range .}}{{tablerow .number .title .headRefName}}{{end}}' | fzf --reverse --multi --accept-nth=1)
    if test -n "$prs"
        for pr in $prs
            gh pr close "$pr"
        end
        return 0
    else
        return 1
    end
end
