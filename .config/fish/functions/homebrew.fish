
# TODO:
# - check if "brew" command exists
# - get path using "brew --prefix"
# - check if the command actually exists

function homebrew
    /opt/homebrew/bin/$argv[1] $argv[2..-1]
end
