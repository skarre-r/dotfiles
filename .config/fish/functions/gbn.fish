
function gbn
    if git rev-parse --is-inside-work-tree &> /dev/null
        if test -d $argv[1]
            echo "branch name required"
        else
            if test -d $argv[2]
                set -f remote "origin"
            else
                set -f remote $argv[2]
            end
            # stash changes
            if test -n "$(git status --porcelain)"
                set -f dirty 1
                git stash save --include-untracked
            else
                set -f dirty 0
            end
            # create new branch
            git switch --create $argv[1]
            # push branch to remote
            git push -u $remote $argv[1]
            # pop changes
            if test $dirty -eq 1
                git stash pop
            end
        end
    end
end
