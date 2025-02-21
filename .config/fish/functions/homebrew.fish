
function homebrew
    if command -v brew > /dev/null
        set -f brew_path (brew --prefix)
        if test -e "$brew_path/bin/$argv[1]"
            /opt/homebrew/bin/$argv[1] $argv[2..-1]
        else
            echo "command not found"
            return 1
        end
    else
        echo "brew is not installed"
        return 1
    end
end
