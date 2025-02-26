
# (g)ithhub (o)rg (r)epos
function gor
    if command -v gh > /dev/null
        if set -q girhub_repos
            and [ "$argv[1]" != "refresh" ]
            for url in $girhub_repos; echo "$url"; end
        else
            set org (gh org list | tail -1)
            set --universal girhub_repos (gh repo list $org --no-archived --json url,viewerPermission --limit 1000 --jq '.[] | select([.viewerPermission] | inside(["ADMIN", "WRITE"])) | .url')
            for url in $girhub_repos; echo $url; end
        end
    else
        echo "gh is not installed!"
    end
end
