
function whoami
    /usr/bin/whoami
    if test -d .git
        echo "$(git config user.name) ($(git config user.email))"
    end
end
