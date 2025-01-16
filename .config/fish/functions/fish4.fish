
# fish 4 beta, installed via homebrew (not in path)
function fish4
    if test -e /opt/homebrew/bin/fish
        /opt/homebrew/bin/fish $argv
    end
end
