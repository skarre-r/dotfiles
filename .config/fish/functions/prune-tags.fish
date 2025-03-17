
function prune-tags
    if git rev-parse --is-inside-work-tree &> /dev/null
        git tag -l | xargs git tag -d
        git fetch --tags
    end
end
