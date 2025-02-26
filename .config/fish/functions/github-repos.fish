
function github-repos
    if command -v gh > /dev/null
        if test -z $github_org
            echo "run the 'github-org' function first to set the github organization"
        else
            if set -q github_repos
                and [ "$argv[1]" != "refresh" ]
                for url in $github_repos; echo "$url"; end
            else
                set org (gh org list | tail -1)
                set --universal github_repos (gh repo list $org --no-archived --json url,viewerPermission --limit 1000 --jq '.[] | select([.viewerPermission] | inside(["ADMIN", "WRITE"])) | .url')
                for url in $github_repos; echo $url; end
            end
        end
    else
        echo "gh is not installed!"
    end
end
