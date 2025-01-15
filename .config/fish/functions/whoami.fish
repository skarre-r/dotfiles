
function whoami
    /usr/bin/whoami
    echo "$(git config user.name) ($(git config user.email))"
end
