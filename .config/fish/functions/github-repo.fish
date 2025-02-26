
function github-repo
    if command -v fzf > /dev/null
        if test -z "$github_repos"
            echo "run the 'github-repos' first function to fetch github repositories"
            return 1
        end
        set -f url (github-repos | fzf --print-query | tail -1)
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
