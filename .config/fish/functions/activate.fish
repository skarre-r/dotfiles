
# "activate virtual environment"
function activate
    if test -e .venv/bin/activate.fish
        source .venv/bin/activate.fish
    end
end
