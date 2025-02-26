
function github-project
    if command -v fzf > /dev/null
        if test -z "$github_projects"
            echo "run the 'github-projects' first function to fetch github projects"
            return 1
        end
        set -f url (github-projects | fzf --accept-nth 2 --print-query | tail -1)
        if test -n "$url"
            open --url $url
            return 0
        end
        return 1
    else
        echo "fzf is not installed!"
        return 1
    end
end
