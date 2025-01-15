
# TODO: stash changes > switch to branch > push branch > pop stash
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
            if git switch --create $argv[1]
                git push -u $remote $argv[1]
            end
        end
    end
end
