
function cmtm
    if git rev-parse --is-inside-work-tree &> /dev/null
        if not test -d $argv[1]
            if not test -d $argv[2]
                git commit -m $argv[1] -m $argv[2]
            else
                echo "cmtm: 2 arguments required"
            end
        else
            echo "cmtm: 2 arguments required"
        end
    end
end
