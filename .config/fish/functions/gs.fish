
function gs
    if test -d .git
        git status -sb
    else
        ls
    end
end
