function curvenv --description 'Show the currently active virtual environment'
    if set -q VIRTUAL_ENV
        basename $VIRTUAL_ENV
    else
        echo "No active venv"
    end
end
