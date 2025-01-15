
function gs
    if git rev-parse --is-inside-work-tree &> /dev/null
        git status -sb
    else
        ls
    end
end
