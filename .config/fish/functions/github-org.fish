
# (g)ithub (org)
function github-org
    if command -v gh > /dev/null
        if command -v fzf > /dev/null
            set -f org (gh org ls | tail -n +1 | fzf --select-1 --print-query | tail -1)
            if test -n $org
                set --universal github_org $org
                echo "github organization set to $org"
                return 0
            end
            return 1
        else
            echo "fzf is not installed!"
            return 1
        end
    else
        echo "gh is not installed!"
        return 1
    end
end
