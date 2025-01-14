
function cmtm
    if test -d .git && $argv[1] != "" && $argv[2] != ""
        git commit -m $argv[1] -m $argv[2]
    end
end
