
function github-pr
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
    set -f pr (gh pr list --json number,title,headRefName,labels,url --template '{{range .}}{{tablerow .number .title .headRefName .url}}{{end}}' | fzf --accept-nth=1 --print-query | tail -1)
    if test -n "$pr"
        gh pr view "$pr" --web
        return 0
    end
    return 1
end
