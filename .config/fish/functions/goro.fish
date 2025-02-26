
# (g)ithhub (o)rg (r)epo (o)pen
function goro
    if command -v gh > /dev/null
        if command -v fzf > /dev/null
            set -f url (gor | fzf --print-query | tail -1)
            if test -n "$url"
                open --url $url
            end
        else
            echo "fzf is not installed!"
        end
    else
        echo "gh is not installed!"
    end
end
