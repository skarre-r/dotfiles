
function github-projects
    if command -v gh > /dev/null
        if test -z $github_org
            echo "run the 'github-org' function first to set the github organization"
        else
            if set -q github_projects
                and [ "$argv[1]" != "refresh" ]
                for project in $github_projects; echo "$project"; end
            else
                set --universal github_projects (gh project list --owner $github_org --format json  --template '{{range .projects}}{{tablerow .title .url}}{{end}}')
                for project in $github_projects; echo "$project"; end
            end
        end
    else
        echo "gh is not installed!"
    end
end
