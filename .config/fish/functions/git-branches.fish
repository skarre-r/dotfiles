
function git-branches -a action
    if ! command -v fzf > /dev/null
        echo "fzf is not installed!"
        return 1
    end

    if ! git rev-parse --is-inside-work-tree &> /dev/null
        echo "failed to run git: fatal: not a git repository (or any of the parent directories): .git"
        return 1
    end

    if not contains $action "close"
        echo "git-branches[close]"
        return 1
    end

    set -f branches (git --no-pager branch -r | sed 's/origin\///' | sed '/HEAD/d' | sed '/main/d' | fzf --reverse --multi --accept-nth=1)
    if not test -n "$branches"
        return 1
    end

    switch $action
    case "close"
        for branch in $branches
            echo "$branch"
        end

        echo

        read -l -P "Delete selected branch(es)? [y/n] " confirm

        switch $confirm
        case "Y" "y" "Yes" "yes"
            for branch in $branches
                git push origin --delete "$branch"
            end
            return 0
        case "*"
            return 1
        end
    end
end
