
function gbn
    if test -d .git
        if $argv[1] != ""
            if $argv[2] != ""
                remote=$argv[2]
            else
                remote="origin"
            end
            git switch --create $argv[1]
            git push -u $remote $argv[1]
        end
    end
end
